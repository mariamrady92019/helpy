import 'dart:async';
import 'dart:developer';
//import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/AllNeededResponse.dart';
import 'package:hexcolor/hexcolor.dart';

import 'NeededPostDetails.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {



  Completer<GoogleMapController> _controller = Completer();

  LatLng _center = const LatLng(45.521563, -122.677433);
      Future<Position> p ;
      Position p2 ;
     List<Data>allMarkers;
    AllNeededResponse all ;

    //to create map of markers and use as set
  final Map<String, Marker> _markers = {};
  Position _currentPosition;


  Future<Position> futurePos;

  var Listt;



  @override
  initState(){
    super.initState();



   if(Commons.allNeededResponse==null){
     ApiServices.getAllNeededHelp(Commons.USERTOKEN).then((value) => Commons.allNeededResponse=value);
   }

   if(Commons.currentPosition==null){
     _getCurrentLocation();

  }else{
     _currentPosition=Commons.currentPosition;
   }
    log("init");
    print("init");

  }

  Future<void> _onMapCreated(GoogleMapController controller){

    _controller.complete(controller);


    setState(() {
      _markers.clear();
      for (final data in Commons.allNeededResponse.data) {
        final marker = Marker(
          markerId: MarkerId('${data.id}'),
          position: LatLng(double.parse(data.latitude), double.parse(data.longitude)),
          infoWindow: InfoWindow(
            title: data.title,
            snippet: data.description,
          ),
          onTap: () {
            showModalBottomSheet<void>(
              useRootNavigator: true,
              elevation: 10,
            context: context,
            builder: (BuildContext context) {
            return  InkWell(
              child: Padding(
                padding: const EdgeInsets.only(top:0.0,right:0,left: 0),
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 5,
                  child: Card(
                    elevation:2,
                    borderOnForeground: true,
                    color: HexColor("#FFFFFF"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              //Row of data of post
                              Container(
                                height:MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width/2.5,
                                child:Card(
                                    elevation:2,
                                    borderOnForeground: true,
                                    color: HexColor("#FFFFFF"),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8),
                                        )
                                    ),
                                    child:Image(image: AssetImage('assets/background.png'),
                                      //this.imageUrl != null? null:
                                      fit: BoxFit.cover,)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,top: 20,right: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    Text(data.title,overflow: TextOverflow.fade, style: TextStyle(color: Commons.textblack,
                                        fontSize: 18,
                                        fontFamily: 'Tajawal'),),
                                    Padding(
                                      padding: const EdgeInsets.only(left:40.0),
                                      child: Row(
                                        children: [
                                          Text("cairo", style: TextStyle(
                                              color: Commons.textHintColr,
                                              fontSize:18,
                                              fontFamily: 'Tajawal'),),
                                          Icon(
                                            Icons.add_location_sharp, color: Commons.textHintColr,
                                            size: 20,)
                                        ],),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:40.0),
                                      child: Row(children: [
                                        Container(
                                          width:MediaQuery.of(context).size.width/7,
                                          child: Card(
                                            elevation: 10,

                                            borderOnForeground: true,
                                            color: Commons.moveColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(3),
                                              ),
                                            ),
                                            child:Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(data.gender, style: TextStyle(color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Tajawal'),),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width:MediaQuery.of(context).size.width/7,
                                          child: Card(
                                            elevation: 10,

                                            borderOnForeground: true,
                                            color: Commons.moveColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(3),
                                              ),
                                            ),
                                            child:Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(data.adult, style: TextStyle(color: Colors.white,
                                                    fontSize: 12,
                                                    fontFamily: 'Tajawal'),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],),
                                    ),

                                  ],
                                ),
                              ),

                              //image of post

                            ],

                          ),

                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>NeededPostDetails(dataObject:data)),
                );
               // print(dataObject.mentalState);
              },
            );

          });},
         // icon:BitmapDescriptor.fromAsset("assets/marker.png"),
          consumeTapEvents: true,
        );
        _markers['${data.id}'] = marker;

      }
    });
   Listt = _markers.values.toList();
  // Listt[1].
    log("on map created");
    print("on map created");
    //_getCurrentLocation();
    var newGoogleMapController;
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(_currentPosition.latitude,_currentPosition.longitude))));


  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [ Padding(
          padding: const EdgeInsets.only(right:40.0,top: 20),
          child: Text("مكانك وأماكن الحالات",style: TextStyle(color: Commons.textblack,fontFamily:'Tajawal'
              ,fontSize: 20),),
        )],
        elevation: 0,
        backgroundColor: Colors.white,

      ),
      body: Center(
       // height: MediaQuery.of(context).size.height,



            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,

              //mapType: MapType.normal,
              //this position map in user location
         initialCameraPosition:CameraPosition(target:LatLng(30,30),tilt: 20.0,zoom:7)

,
              markers: _markers.values.toSet(),


            ),
          ),


        );


  }


 _getCurrentLocation() async{
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        Commons.currentPosition=position;
        print("lat is ${_currentPosition.latitude}");

      });


    }).catchError((e) {
      print(e);
    });
    //return _currentPosition;
  }

}
