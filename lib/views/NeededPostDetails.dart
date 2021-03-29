
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/models/AllNeededResponse.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast/toast.dart';
//import 'package:intl/intl.dart';

class NeededPostDetails extends StatefulWidget {
  final Data dataObject ;

  const NeededPostDetails( {Key key,@required this.dataObject}) : super(key: key);
  @override
  _NeededPostDetailsState createState() => _NeededPostDetailsState(dataObject);
}

class _NeededPostDetailsState extends State<NeededPostDetails> {
  final Data dataObject ;

  _NeededPostDetailsState(this.dataObject);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height/3,
                      child:
                      //dataObject==null?Image(image: AssetImage('assets/background.png')):Image.network(dataObject.proof)
                      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-g_z5qqnJP9ecanB6ZJrbAN0LwFBWztMWiw&usqp=CAU",fit:BoxFit.cover,)
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top:30,right:8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: Text(dataObject.user , style: TextStyle(color: Commons.textblack,fontSize:20,fontFamily: 'Tajawal'),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:30.0 ,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                    padding: const EdgeInsets.only(right:30.0,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(dataObject.gender, style: TextStyle(
                            color: Commons.textHintColr,
                            fontSize:18,
                            fontFamily: 'Tajawal'),),
                        Icon(

                          Icons.pregnant_woman_sharp, color: Commons.textHintColr,
                          size: 20,)
                      ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:28,left:20,top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("وصف الحالة:",style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                        Text
                          ( dataObject.description!=null? dataObject.description
                            :"لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف. خمسة قرون من الزمن لم تقضي على هذا النص، بل انه حتى صار مستخدماً وبشكله الأصلي في الطباعة والتنضيد الإلكتروني."
                            "(Letraset) البلاستيكية تحوي مقاطع من هذا النص، وعاد لينتشر مرة أخرى مؤخراَ مع ظهور برامج النشر الإلكتروني مثل(Aldus PageMaker) والتي حوت أيضاً على نسخ من نص لوريم إيبسوم.",
                          style: TextStyle(color: Commons.textblack,fontSize: 16),maxLines: 8,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          // width:MediaQuery.of(context).size.width/7,
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
                                child: Text(dataObject==null?"": Commons().convertDateToForm(dataObject.createdAt), style: TextStyle(color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Tajawal'),),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // width:MediaQuery.of(context).size.width/7,
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
                                child: Text(dataObject==null?"":dataObject.mentalState, style: TextStyle(color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Tajawal'),),
                              ),
                            ),
                          ),
                        ),

                      ],),
                  ),
                  Container(
                    height:30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.9,
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
                              helpThisNeededone();
                            },
                            child: Text(
                              "سأساعد الحالة",
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 16.5),
                            ))),
                  ),


                ],
              ),
              Positioned(
                top: 30,
                  left: 15,
                  child: InkWell(
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 50,),
                    onTap:() =>  Navigator.pop(context),
                  ),

              )
            ],

          ),
        ),
      );

  }

  void helpThisNeededone() {}




}
