
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ProfileDataResponse.dart';
import 'package:helpy/networking/models/ProfileDataModel.dart';
import 'package:helpy/views/HomePage.dart';
import 'package:helpy/views/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
 static bool logined =false;


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readShared();
    readProfileData();
    checkInternetConnectionn();

  }
 checkInternetConnectionn()async{
   try {
     final result = await InternetAddress.lookup('google.com');
     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
       setState(() {
         Commons.connected =true;
       });
     }
   } on SocketException catch (_) {
     setState(() {
       Commons.connected=false;
     });
   }
   // print('iternet $connected');
 }





  readShared()async{
    final prefs = await SharedPreferences.getInstance().then((value) =>
    {print("shared is $logined then value")
    ,
    setState(() {
    logined= value.getBool('logined')?? false;
    Commons.USERTOKEN=value.getString('userTaken')??"";

    })
    });
   // prefs.remove('logined');

// Try reading data from the counter key. If it doesn't exist, return 0.

    print("shared is $logined in main");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Stack(children: [
        SplashScreen(
          photoSize:100,
          seconds: 4,
          navigateAfterSeconds:logined == true? new HomePage():new Login(),
          backgroundColor: Colors.white,
          styleTextUnderTheLoader: new TextStyle(),
          onClick: ()=>print("Flutter Egypt"),
          //  loaderColor: Colors.red
        ),

        Image(image: AssetImage('assets/background.png'),width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,),

      ],)

    );
  }

  void readProfileData() async{

      final SharedPreferences prefs = await SharedPreferences.getInstance();

     // Map<String, dynamic> userMap;
      final String userStr = prefs.getString('user');
      if (userStr != null) {
       // userMap = jsonDecode(userStr) as Map<String, dynamic>;
        Commons.profileDataResponse=ProfileDataResponse.fromJson(jsonDecode(userStr));
      }

     /* if (userMap != null) {
        final User user = User.fromJson(userMap);
        print(user);
        return user;
      }*/
      return null;

  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("After SplashScreen"),
          automaticallyImplyLeading: false
      ),
      body: new Center(
        child: new Text("Done!",
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
          ),),

      ),
    );
  }
}