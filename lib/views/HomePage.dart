import 'dart:collection';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/views/AddNewNeeded.dart';
import 'package:helpy/views/Login.dart';
import 'package:helpy/views/MoreOptions.dart';
import 'package:helpy/views/Register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AllNeededHelp.dart';
import 'MapPage.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {



  int _selectedPage= 2;

  GlobalKey _bottomNavigationKey = GlobalKey();
List<Widget> pages=<Widget>[
  //0 index is more page
  MoreOptions(),

  //1 index is profile page
    Profile(),
  //2 index is add new
  AllNeededHelp(),

  //3 index is map
  MapPage(),
  //4 index ia all
  AddNewNeeded(),

  ];


  CurvedNavigationBarState navBarState ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getProfilData();
    getCurrentLocation();
    initialShared();
  }

  initialShared()async{
    final prefs= await SharedPreferences.getInstance();
    prefs.setBool('logined', true);
    prefs.setString('userTaken', Commons.USERTOKEN);

    print('loooogined   in shared');

  }

  @override
  Widget build(BuildContext context) {
    navBarState =
        _bottomNavigationKey.currentState;
    return MaterialApp(
      home: Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              key: _bottomNavigationKey,
             color: Colors.white,
              backgroundColor: Commons.accentColor,
              buttonBackgroundColor: Colors.white,
              index: _selectedPage,
               // height: 65,
              animationCurve: Curves.easeIn,
              animationDuration: Duration(milliseconds: 400),
              items: <Widget>[


                    InkWell(
                        child: Icon(Icons.menu, size: 30)
                    ,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>MoreOptions()),
                        );
                      },
                    ),


                    InkWell(

                        child: Icon(Icons.person, size: 30)
                    ,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Profile()),
                        );
                      },


                    ),



                Icon(Icons.article_outlined, size: 30)
                ,


                   // Text("اضافة حالة")
                InkWell(
                        child: Icon(Icons.map, size: 30)
                    ,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>MapPage()),
                        );
                      },
                    ),
                    //Text("الخريطة")
                InkWell(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>AddNewNeeded()),
                      );
                    },
                    child: Icon(Icons.add, size: 30)),



              ],

              onTap: (index) {
                //Handle button tap
               setState(() {
                 _selectedPage=index;


               });
               print('page number$_selectedPage');


                navBarState.setPage(_selectedPage);
              },
            ),
            body: Container(color:Colors.white,child: pages[_selectedPage],),

          ),
      );


  }



  void getCurrentLocation() {
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      setState(() {
       // _currentPosition = position;
        Commons.currentPosition=position;
       // print("lat is ${_currentPosition.latitude}");
      });
    });
  }
}


