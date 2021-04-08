

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
//import 'package:intl/intl.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _ProfileName;

  var _numberOfStatus;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Directionality(
       textDirection:TextDirection.rtl,
       child: Container(
         height: MediaQuery.of(context).size.height,
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.only(top:50.0,right: 35),
               child: Row(
                 children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.black38,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                         radius: 40,
                         backgroundImage:  AssetImage('assets/background.png'),
                        ),
                      ),


                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                         Commons.profileDataResponse.data==null?"":'${Commons.profileDataResponse.data.fName} ${Commons.profileDataResponse.data.lName}' ,
                         style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                   ),

                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.45,
                      height:MediaQuery.of(context).size.height/7,
                      child: Card(
                        elevation:2,
                        borderOnForeground: true,
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),
                          ),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Text(' 121',style: TextStyle(color:Colors.white,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('عدد الحالات التي تم نشرها',style: TextStyle(color:Colors.black45,fontFamily: 'Tajawal',fontSize:14), textDirection: TextDirection.rtl),
                          ),

                        ],),
                      ),
                    ),
                   Container(
                     width: MediaQuery.of(context).size.width*0.45,
                     height:MediaQuery.of(context).size.height/7,
                     child: Card(
                       elevation:2,
                       borderOnForeground: true,
                       color: Colors.orangeAccent,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(15),
                         ),
                       ),
                       child: Column(children: [
                         Padding(
                           padding: const EdgeInsets.only(top:20.0),
                           child: Text('121',style: TextStyle(color:Colors.white,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('عدد الحالات التي تم مساعدتها',style: TextStyle(color:Colors.black45,fontFamily: 'Tajawal',fontSize:14), textDirection: TextDirection.rtl),
                         ),

                       ],),
                     ),
                   ),
                 ],
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(top:20.0,right: 20),
               child: Text('بيان بمساعدتك خلال العام:',style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
             ),
             Container(height: 100,
             width: 100,
               child:LineChart(
                 LineChartData(
                   // read about it in the LineChartData section
                 ),
                 swapAnimationDuration: Duration(milliseconds: 150), // Optional
                 // Optional
               ) ,
             )
           ],
         ),
       ),
     ),
    );
  }
}
