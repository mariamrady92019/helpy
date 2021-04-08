
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/AllNeededResponse.dart';
import 'package:helpy/views/PostNeeded.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:pagination_view/pagination_view.dart';

class AllNeededHelp extends StatefulWidget {
  @override
  _AllNeededHelpState createState() => _AllNeededHelpState();
}

class _AllNeededHelpState extends State<AllNeededHelp> {

  Future<AllNeededResponse> allneeded ;
  var all = <PostNeeded>[];
  AllNeededResponse  getData;
  List<Data>allData=<Data>[];
  List<Data> secondallData=<Data>[];

  AllNeededResponse  secondgetData;

  int page;
  PaginationViewType paginationViewType;
  GlobalKey<PaginationViewState> key;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   allneeded = ApiServices.getAllNeededHelp(Commons.USERTOKEN);
   allneeded.then((value) =>{
     getData=value ,
     allData=value.data
   } );

   checkInternetConnectionn();
    page = -1;
    paginationViewType = PaginationViewType.listView;
    key = GlobalKey<PaginationViewState>();

   //print('list++++${Commons.allNeededResponse.links.next}allneeded');


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
      body:Commons.connected==false?Center(child: Icon(Icons.wifi_off),):
         Center(
            child: FutureBuilder<AllNeededResponse>(
              future: allneeded,
              builder: (context, snapshot) {
                if ( snapshot.hasData) {
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

                  return Center(child: Text("من فضلك حاول مرة أخري"));
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

  Future<List<Data>> pageFetch(int currentListSize)async{
   final String _BASE_URL = 'http://dsc-helpy.herokuapp.com/api';

    if( false){
      secondgetData=null;
      return secondallData;
    }else{
     var response = await get(
       '$_BASE_URL/v1/marker'
       ,
       headers: <String, String>{
         'Authorization': Commons.USERTOKEN
       },);

     if(response.statusCode==200){

       secondgetData= AllNeededResponse.fromJson(jsonDecode(response.body));
       Commons.allNeededResponse=secondgetData;
       print(response.body);
       print('second success ok');
       return secondgetData.data;

     }else{
       print('didnt ok');
       return null;
     }

      }


   }

  }

