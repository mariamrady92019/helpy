
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/AllNeededResponse.dart';
import 'package:helpy/views/PostNeeded.dart';
import 'package:hexcolor/hexcolor.dart';

class AllNeededHelp extends StatefulWidget {
  @override
  _AllNeededHelpState createState() => _AllNeededHelpState();
}

class _AllNeededHelpState extends State<AllNeededHelp> {

  Future<AllNeededResponse> allneeded ;
  var all = <PostNeeded>[];
  AllNeededResponse  getData;
  List<Data>allData=<Data>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   allneeded = ApiServices.getAllNeededHelp(Commons.USERTOKEN);

   print(allneeded);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [ Padding(
          padding: const EdgeInsets.only(right:22.0,top: 20),
          child: Text(Commons.allStatuseTitle,style: TextStyle(color: Commons.textblack,fontFamily:'Tajawal'
              ,fontSize: 20),),
        )],
        elevation: 0,
        backgroundColor: Colors.white,

        ),
      body:
          Center(
            child: FutureBuilder<AllNeededResponse>(
              future: allneeded,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //get data all posts and links and meta
                  getData=snapshot.data;
                  //alldata list of posts
                  allData=getData.data;
                    buildListOfNeededPosts();
                  return SingleChildScrollView(
                  //  physics: ,
                    child: Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left:13.0,right:15,top:12),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.7,
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    decoration: new InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(17),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 0.8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38 , width: 0.8),
                                      ),
                                      hintText: 'بحث..',
                                      hintStyle: TextStyle(
                                          color:Commons.textHintColr,
                                          fontSize: 16,
                                          fontFamily: 'Tajawal'),
                                    ),
                                    onChanged: (value) {
                                      //_password = value;
                                    },
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height/14,
                                  width: MediaQuery.of(context).size.width*0.17,

                                  child: Card(
                                      elevation:2,
                                      borderOnForeground: true,
                                      color: HexColor('#1982C4'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5),
                                        ),
                                      ),
                                      child: Icon(Icons.filter_alt_sharp,
                                        color: Colors.white,size: 35,)),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: ListView.builder(
                            physics:  NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:all==null?0:all.length ,
                              itemBuilder: (context, index) {
                                return all[index];
                              },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {

                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),


    );
  }

  List<Widget>buildListOfNeededPosts() {
       allData.forEach((element) {

         all.add(new PostNeeded(dataObject: element,));
       });
       return all;
  }
}
