import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpy/main.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/LoginResponse.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../Commons.dart';
import 'HomePage.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _email;
  var _password;
 bool valided;
  bool isLoading = false;



  Future<LoginResponse> _loginResponse;
  final key = GlobalKey<ScaffoldState>();
  ProgressDialog pr;
  double percentage = 0.0;

  String validatedString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Commons.checkInternetConnectionn();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.white60,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.5,
                          child: Image(
                            image: AssetImage('assets/background.png'),
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Card(
                            elevation: 20,
                            borderOnForeground: true,
                            color: HexColor("#FFFFFF"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Center(
                                    child: Text(
                                      "أهلا بك",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Tajawal',
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        "الايميل",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  child: Container(
                                    child: TextFormField(
                                      textDirection: TextDirection.rtl,
                                      validator: (value) {
                                        if(!value.contains("@")||value==null){
                                          return"ادخل ايميل صحيح";
                                        }
                                      },

                                      decoration: new InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(17),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black12, width: 2),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black12, width: 2),
                                        ),
                                        hintText: 'ادخل ايميلك',
                                        hintStyle: TextStyle(
                                            color: HexColor('#707070'),
                                            fontSize: 12,
                                            fontFamily: 'Tajawal'),
                                      ),
                                      onChanged: (value) {
                                        _email = value;
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        "الباسورد",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Tajawal',
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                //passowrd textfield
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 12),
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
                                      hintText: 'ادخل الباسورد',
                                      hintStyle: TextStyle(
                                          color: HexColor('#707070'),
                                          fontSize: 12,
                                          fontFamily: 'Tajawal'),
                                    ),
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                ),
                                //sign button
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
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
                                            Commons.checkInternetConnectionn().then((value) => {
                                            valided = validate(_email, _password),
                                                print(
                                                '$valided is rwesult of validation'),
                                            if (Commons.connected) {
                                              if (valided) {
                                                pr = new ProgressDialog(context,
                                                    showLogs: true,
                                                    isDismissible: true),
                                                pr.style(
                                                    message: '...من فضلك انتظر'),
                                                pr.show(),

                                                // _loginResponse =
                                                ApiServices
                                                    .loginByEmailAndPassword(
                                                    _email, _password)
                                                    .then((value) =>login()),

                                              } else if (!valided&&validatedString==null){
                                                print(
                                                    '$valided is rwesult of validation'),
                                                Toast.show(
                                                    "من فضلك ادخل البيانات",
                                                    context,
                                                    duration: Toast.LENGTH_LONG,
                                                    gravity: Toast.BOTTOM
                                                    ,backgroundColor: Colors.indigo
                                                ),
                                              }else{
                                                Toast.show(
                                                    validatedString,
                                                    context,
                                                    duration: Toast.LENGTH_LONG,
                                                    gravity: Toast.BOTTOM
                                                    ,backgroundColor: Colors.indigo
                                                ),
                                              }
                                            } else {
                                              Toast.show(
                                                  "من فضلك اتصل بالانترنت",
                                                  context,
                                                  duration: Toast.LENGTH_LONG,
                                                  gravity: Toast.BOTTOM),
                                            }

                                            });

                                            /*Navigator.of(context).push(CupertinoPageRoute(
                                            builder: (BuildContext context) => HomePage()));*/
                                          },
                                          child: Text(
                                            "تسجيل الدخول",
                                            style: TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontSize: 17.5),
                                          ))),
                                ),

                                //forget password
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: InkWell(
                                    child: Text(
                                      "نسيت كلمة المرور",
                                      style: TextStyle(
                                          color: HexColor('#1982C4'),
                                          fontSize: 14,
                                          fontFamily: 'Tajawal'),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ليس لديك حساب؟",
                                      style: TextStyle(
                                          color: HexColor('#191919'),
                                          fontSize: 14,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.w200),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 0.0),
                                      child: InkWell(
                                        child: Text(
                                          "أنشئ حساب",
                                          style: TextStyle(
                                            color: HexColor('#1982C4'),
                                            fontSize: 14,
                                            fontFamily: 'Tajawal',
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Register()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  bool validate(email, password) {

    if (email != null && password != null&&email.toString().isNotEmpty&&email.toString().isNotEmpty) {
     validatedString  = validation(email , password);
          if(validatedString!=null){
           // Toast.show(validatedString, context);
            return false;
          }

      return true;
    }
    return false ;
  }


  void login() {
    /* Future.delayed(
        Duration(seconds: 6))
        .then((value) {*/


    if (ApiServices.goLogin) {
      Commons.USERTOKEN = ApiServices.loginResponse.user_token;
      ApiServices.getProfileData( Commons.USERTOKEN ).then((value) => {
      print('user taken is ${ApiServices.loginResponse.user_token}'),

      print('navigate'),
      pr.hide(),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      )});
    } else {
      //request  done ok but error massege
      //gologin false
      print('null');
      pr.hide();

      if (ApiServices.loginResponse.msg == null) {
        Toast.show("حاول مرة اخري", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      } else {
        pr.hide();

        Toast.show(ApiServices.loginResponse.msg, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      }
    }
  }

  String validation(email , password) {
    if(!(email.contains("@")))
    {
      return"ادخل ايميلا صحيحا";
    }
  if(password.length<6){
      return "لابد ان يكون الباسورد اكثر من6أحرف";
    }


    return null;
  }
}
