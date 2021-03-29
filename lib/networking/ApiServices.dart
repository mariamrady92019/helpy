 import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/views/AllNeededHelp.dart';
import 'package:http/http.dart';

import 'models/AddNewModel.dart';
import 'models/AllNeededResponse.dart';
import 'models/LoginResponse.dart';
import 'models/RegisterResponse.dart';

class ApiServices extends StatelessWidget{


 static  final String _BASE_URL = 'http://dsc-helpy.herokuapp.com/api';
  static bool goLogin=false;
 static bool goRegistered=false;
  static LoginResponse loginResponse;
 static RegisterResponse registerResponse;
 static AllNeededResponse allNeededResponse;
 static RegisterResponse addNew;

 static String msg ;


 static Future<LoginResponse> loginByEmailAndPassword(String email, String password) async{
   var data={
     "email": email,
     "password": password
   };

   //make a request and get response
   var response = await  post('$_BASE_URL/v1/login',
       headers: <String, String>{
         'Content-Type': 'application/json;charset=UTF-8'
       },
       body: jsonEncode(data));
   //check if operation done or not
   if (response.statusCode==200) {
     //convert response from json to map
     //String map = jsonDecode(response.body);
     //take this string -as a map- and create dart object with named constructor
   loginResponse= LoginResponse.decode(jsonDecode(response.body));

     print(response.body);
     print('this is ${loginResponse.msg}');
    goLogin = true;
   print('gologin $goLogin');
     return loginResponse;
     //Author.fromJson(json.decode(response.body));
   } else {
     goLogin=false ;
     print("error ocuur");
    loginResponse= LoginResponse.decode(jsonDecode(response.body));
    msg="not valid";
     return null;
     //throw Exception("Can't load author");
   }



 }

 static Future<RegisterResponse> rigester(String f_name , String l_name,String email , String phone , String password)async{
   var data={
     "f_name": f_name,
     "l_name": l_name,
     "email" :email,
     "phone" : phone,
     "password": password
   };
   //make request
   var response=await post('$_BASE_URL/v1/register',
       headers: <String, String>{
     'Content-Type': 'application/json;charset=UTF-8'
   },
       body: jsonEncode(data));

   //convert response

       if(response.statusCode==201){
         registerResponse = RegisterResponse.decode(jsonDecode(response.body));
          goRegistered=true ;
          print(response.body);
          print('this is ${loginResponse.msg}');
          print(goRegistered);
          return registerResponse;
       }else {
         goRegistered = false;
         print(response.body);
         print('this is not valid');
         print(goRegistered);
         return registerResponse;
       }}
       
       static Future<AllNeededResponse> getAllNeededHelp(String userTaken) async{
          userTaken= 'bearer ${Commons.USERTOKEN}';
        //make the request
          var response = await get(
              '$_BASE_URL/v1/marker',
          headers: <String, String>{
            'Authorization': userTaken
          },);
          if(response.statusCode==200){

            allNeededResponse = AllNeededResponse.fromJson(jsonDecode(response.body));
            Commons.allNeededResponse=allNeededResponse;
             print(response.body);
             print('success ok');
             return allNeededResponse;

          }else{
            print('didnt ok');
            return null;
          }

   
       }


   static Future<RegisterResponse>  addNewNeededStatus(userToken ,title , gender , mental , adult, lat , lang , image , desc)async{
     userToken= 'bearer ${Commons.USERTOKEN}';
     //make the request
     var data={
       "title":title,
       "gender": gender,
       "mental_state" : mental,
       "adult" : adult,
       "latitude":lat,
       "longitude": lang,
       "proof": image,
     "description": desc,
     };
     var response = await post(
       '$_BASE_URL/v1/marker',
       headers: <String, String>{
         'Authorization': userToken
       },body: jsonEncode(data));

     if(response.statusCode==201){

       addNew = RegisterResponse.decode(jsonDecode(response.body));
      // Commons.allNeededResponse=allNeededResponse;
       print(response.body);
       print('success ok');
       return addNew;

     }else{

       addNew = RegisterResponse.decode(jsonDecode(response.body));

       print('didnt ok${addNew.msg}');

       return addNew;
     }

       }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return null;
  }





   }

