import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/models/AllNeededResponse.dart';
import 'package:helpy/views/NeededPostDetails.dart';
import 'package:hexcolor/hexcolor.dart';

import 'HomePage.dart';

class PostNeeded extends StatelessWidget {
 // final Data dataObject;



final Data dataObject ;

  const PostNeeded( {Key key,@required this.dataObject}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return
      InkWell(
        child: Padding(
          padding: const EdgeInsets.only(top:8.0,right: 15,left: 15),
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
                      child:Card(
                        elevation:2,
                        borderOnForeground: true,
                        color: HexColor("#FFFFFF"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8),
                            )
                        ),
                        child:
                        //dataObject.proof==null?
                        Image(image: AssetImage('assets/background.png'),
                          //this.imageUrl != null? null:
                          fit: BoxFit.cover,)
                              //: Image.network(dataObject.proof),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 20,right: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(dataObject==null?"":dataObject.title, style: TextStyle(color: Commons.textblack,
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
                                      child: Text(dataObject==null?"":dataObject.gender, style: TextStyle(color: Colors.white,
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
                                      child: Text(dataObject==null?"":dataObject.adult, style: TextStyle(color: Colors.white,
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
            MaterialPageRoute(builder: (context) =>NeededPostDetails(dataObject:this.dataObject)),
          );
          print(dataObject.mentalState);
        },
      );
  }

  void helpThisNeededone() {}
}
