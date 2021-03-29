
import 'package:flutter/material.dart';
import 'package:helpy/views/Login.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Stack(children: [
        SplashScreen(
          photoSize:100,
          seconds: 3,
          navigateAfterSeconds: new Login(),
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