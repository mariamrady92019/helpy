import 'package:flutter/material.dart';

import '../Commons.dart';


class MoreOptions extends StatefulWidget {
  @override
  _MoreOptionsState createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top:50.0,right: 25),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.black38,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          backgroundImage:  AssetImage('assets/background.png'),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                Commons.profileDataResponse.data==null?"null":'${Commons.profileDataResponse.data.fName} ${Commons.profileDataResponse.data.lName}' ,
                                style: TextStyle(color: Commons.textblack,fontFamily: 'Tajawal',fontSize: 18), textDirection: TextDirection.rtl),
                            Text("اعدادات حسابي",
                                style: TextStyle(color: Colors.black45,fontFamily: 'Tajawal',fontSize: 14), textDirection: TextDirection.rtl),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:20.0),
                        child: InkWell(
                            onTap: () {

                            },
                            child: Icon(Icons.arrow_back_ios_outlined, color: Colors.black,)),
                      )

                    ],
                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height:MediaQuery.of(context).size.height/12,
                    child: Card(
                      elevation:5,
                      borderOnForeground: true,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.accessibility_sharp,color: Colors.blue,),
                          title: Text("المساعدة",style: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 18),),
                          trailing:  Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
                        ),
                      ),
                    ),

                  ),
                ),
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height:MediaQuery.of(context).size.height/12,
                    child: Card(
                      elevation:5,
                      borderOnForeground: true,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.warning,color: Colors.blue,),
                          title: Text("حول التطبيق",style: TextStyle(color: Colors.black,fontFamily: 'Tajawal',fontSize: 18),),
                          trailing:  Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
                        ),
                      ),
                    ),

                  ),
                ),
              ),

          ],),
        ),
      ),
    );
  }
}
