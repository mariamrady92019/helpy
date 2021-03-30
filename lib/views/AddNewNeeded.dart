
//import 'dart:html';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/AddNewModel.dart';
import 'package:helpy/views/MoreOptions.dart';
import 'package:helpy/views/NeededPostDetails.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart' as intl;
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:ui';

import '../Commons.dart';
import 'HomePage.dart';

class AddNewNeeded extends StatefulWidget {
  @override
  _AddNewNeededState createState() => _AddNewNeededState();
}

class _AddNewNeededState extends State<AddNewNeeded> {
  final key = GlobalKey<ScaffoldState>();
  String _title;
  String description ;

  //true if man , false if woman
   bool manSelected=false;
  int gender=1;
  bool buttonManSelected=false;
  bool buttonWomanSelected=false;
  int adult=1;

  List<String> citesList=[] ;

  int mentalStatus=1;
  File _image;
  final picker = ImagePicker();

  Position _currentPosition;

  var adultList=['طفل', 'بالغ','مُسن'];

  var genderList=['انثي', 'ذكر'];

  var mentalList=['سوي عقليا', 'غير سوي عقليا'];

  ProgressDialog pr;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Directionality(
          textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left:60,top: 15),
              child: Text("اضافة حالة",style: TextStyle(color: Commons.textblack,fontFamily:'Tajawal'
                  ,fontSize: 20),),
            ),
          ),
          leading:
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding:const EdgeInsets.only(top:15,right:15.0),
              child: Icon(Icons.arrow_back ,color: Colors.black,),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: HexColor('#F9FDFF'),
          child:
              Padding(
                padding: const EdgeInsets.only(top:20,right: 8),
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("موضوع الحالة:",style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 12 ,top :10),
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: new InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(17),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12, width: 2.0),
                          ),
                          hintText: "احتياج الحالة...",
                          hintStyle: TextStyle(
                              color: HexColor('#707070'),
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                        ),
                        onChanged: (value) {
                          _title = value;
                        },
                      ),
                    ),
                    Text("اختر النوع:",style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),

                    Padding(
                      padding: const EdgeInsets.only(
                          left:0, right: 0, bottom: 12),
                      child: Center(
                        child: ToggleSwitch(
                          initialLabelIndex: 1,
                          minWidth:MediaQuery.of(context).size.width*0.8,
                          cornerRadius: 8.0,
                          activeBgColor: Colors.purple,
                          activeFgColor: Colors.white,
                          inactiveBgColor:Colors.black12,
                          inactiveFgColor: Colors.black,
                          labels: genderList,
                          icons: [Icons.pregnant_woman_sharp, Icons.pregnant_woman],
                          onToggle: (index) {
                            //sawy if zero not if 1
                            gender=index;
                            //index==0?adult=true:false;
                            print(gender);
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                    Text("اختر البلد-المدينة",style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),

                    Padding(
                      padding: const EdgeInsets.only(
                         top:15, left: 15, right: 15, bottom: 15),
                      child: Container(
                        height: MediaQuery.of(context).size.height/15,
                        child: DropdownSearch<String>(
                            mode: Mode.MENU,
                            showSelectedItem: true,
                            items:citesList,
                            label: "البلد",
                            hint: "country in menu mode",
                            popupItemDisabled: (String s) => s.startsWith('I'),
                            onChanged: print,
                            selectedItem: "القاهرة"),
                      ),
                    ),
                    Text("وصف الحالة",style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 12,top:10),
                      child: Stack(
                         children:[
                      TextField(
                        minLines: 8 ,
                        maxLines: 20,
                        textDirection: TextDirection.rtl,
                        decoration: new InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(17),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black12, width: 2.0),
                          ),
                          hintText: "احتياج الحالة...",
                          hintStyle: TextStyle(
                              color: HexColor('#707070'),
                              fontSize: 12,
                              fontFamily: 'Tajawal'),
                        ),
                        onChanged: (value) {
                          description = value;
                        },
                      ),



                      Positioned(
                        bottom: 10, left: 10,
                          child: Text("لا يقل عن 50 حرف",style: TextStyle(color: Colors.black12,fontFamily: 'Tajawal',fontSize:14), textDirection: TextDirection.rtl)),

                         ]),
                    ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left:0, right: 0, bottom: 12),
                          child: Center(

                            child: ToggleSwitch(
                              initialLabelIndex: 1,
                              minWidth: 60.0,
                              cornerRadius: 10.0,
                              activeBgColor: Colors.purple,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.black12,
                              inactiveFgColor: Colors.black,
                              labels: adultList ,
                              //icons: [Icons.check, Icons.check],
                              onToggle: (index) {

                                print('switched to: $index');
                                adult=index;
                                print(adult);

                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left:0, right: 0, bottom: 12),
                          child: Center(
                            child: ToggleSwitch(
                              initialLabelIndex: 1,
                              minWidth: 70.0,
                              cornerRadius: 10.0,
                              activeBgColor: Colors.purple,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.black12,
                              inactiveFgColor: Colors.black,
                              labels: mentalList,
                              //icons: [Icons.check, Icons.check],
                              onToggle: (index) {
                                //sawy if zero not if 1
                                mentalStatus=index;
                                //index==0?adult=true:false;
                                print(mentalStatus );
                                print('switched to: $index');
                              },
                            ),
                          ),
                        ),

                      ],),
                    InkWell(
                      onTap: () {
                              pickImage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:8.0,right:8),
                        child: Row(
                          children: [
                          Icon(Icons.camera_alt,color: Colors.blue,size: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Text("رفع صورة للحالة",style: TextStyle(color: Colors.blue,fontSize: 16,fontFamily: 'Tajawal'),),
                            )
                        ],),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:20.0,bottom: 8),
                      child: Text("يرجي التنويه بأنه يجب أخذ اذن الحالة",style: TextStyle(color: Colors.black26,fontFamily: 'Tajawal',fontSize:12)),
                    ),
                    Center(
                      child: Container(
                        height:_image==null?0:MediaQuery.of(context).size.height/5,
                        width: MediaQuery.of(context).size.width*0.85,

                        child:Card(
                            elevation:2,
                            borderOnForeground: true,
                           color: Colors.black54,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10),
                                )
                            ),
                            child:_image == null
                                ? Text('No image selected.')
                                : Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.file(_image,fit: BoxFit.cover,),
                                ),),
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10,bottom: 10,left: 20,right: 20),
                      child: Container(
                          width: MediaQuery.of(context).size.width *
                              0.8,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      HexColor('#1982C4')),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          side: BorderSide(
                                              color: Colors.red)))),
                              onPressed: () {
                                // Respond to button press
                                addNewNedded();
                              },
                              child: Text(
                                "نشر الحالة",
                                style: TextStyle(
                                    fontFamily: 'Tajawal',
                                    fontSize: 16.5),
                              ))),
                    ),
                       ]
                ),


          ),
        ),
      ),

        )


  );

}

  showGenderDropDown() {
    var dropdownValue='first';
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height:MediaQuery.of(context).size.height/20 ,
      child: Padding(
        padding: const EdgeInsets.only(right:00.0),
        child: DropdownSearch<String>(
          showSearchBox: false,
            mode: Mode.MENU,
            showSelectedItem: true,
            items: ["ذكر", "أنثي",],
            label: "اختر النوع",
            hint: "country in menu mode",
            popupItemDisabled: (String s) => s.startsWith('I'),
            onChanged: print,
            selectedItem: "أنثي"),
      ),
    );
  }

  Future pickImage() async {
     final image = await ImagePicker.pickImage(source: ImageSource.camera);
     setState(() {
       _image = image;
     });

    }

  void addNewNedded() {
    if(_title==null){
      Toast.show(
          "من فضلك اذكر احتياج الحالة",
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
      print('msg null');
      return;

    }
      if(Commons.currentPosition==null){
       getCurrentLocation();}
     String genderr= genderList[gender];
     String adultt = adultList[adult];
     String mental = mentalList[mentalStatus];
      ApiServices.addNewNeededStatus(Commons.USERTOKEN,_title,genderr,mental,adultt,
          Commons.currentPosition.latitude,Commons.currentPosition.longitude, _image,description);
     pr = new ProgressDialog(context,
         showLogs: true,
         isDismissible: true);
     pr.style(
         message: 'انتظر من فضلك ...');
      pr.show();

     Future.delayed(
         Duration(seconds: 5))
         .then((value) {

      // AddNewModel model = AddNewModel("ملابس", genderr, mental, adultt,Commons.currentPosition.latitude,Commons.currentPosition.longitude, _image,description);


        pr.hide().whenComplete(() {
        if (ApiServices.addNew.status==false||ApiServices.addNew==null) {
        Toast.show(
        "من فضلك حاول مرة اخري",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
        print('msg null');

        pr.hide();}
        else{
        Toast.show(
        "تمت اضافة الحالة",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
        Navigator.pop(context);
        }});
        });



  }





  void getCurrentLocation() {
    Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        Commons.currentPosition=position;
        print("lat is ${_currentPosition.latitude}");

      });
     });}





}