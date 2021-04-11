import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpy/Commons.dart';
import 'package:helpy/networking/ApiServices.dart';
import 'package:helpy/networking/models/LoginResponse.dart';
import 'package:helpy/networking/models/RegisterResponse.dart';
import 'package:helpy/views/Login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

import 'HomePage.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _fName;
  String _lName;
  String _password;
  String phoneNumber;

  String _email;

  ProgressDialog pr;

  var validatedString;

 // Future<RegisterResponse> registerResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Commons.checkInternetConnectionn();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
                      height: MediaQuery.of(context).size.height*0.5,
                      child: Image(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fitHeight,
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height /4,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),

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
                            child:Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Center(
                                    child: Text(
                                      "انشاء حساب",
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
                                        "الاسم الاول ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
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
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
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
                                        hintText: 'ادخل اسمك',
                                        hintStyle: TextStyle(
                                            color: HexColor('#707070'),
                                            fontSize: 12,
                                            fontFamily: 'Tajawal'),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _fName = value;
                                        });

                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        "الاسم الاخير ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
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
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
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
                                        hintText: 'ادخل الاسم',
                                        hintStyle: TextStyle(
                                            color: HexColor('#707070'),
                                            fontSize: 12,
                                            fontFamily: 'Tajawal'),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _lName = value;
                                        });

                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        "رقم الهاتف",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
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
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      keyboardType:TextInputType.phone ,
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
                                        hintText: 'ادخل رقمك',
                                        hintStyle: TextStyle(
                                            color: HexColor('#707070'),
                                            fontSize: 12,
                                            fontFamily: 'Tajawal'),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          phoneNumber = value;
                                        });
                                        phoneNumber = value;
                                      },
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      child: Text(
                                        "الايميل ",
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
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
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      keyboardType: TextInputType.emailAddress,
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
                                        setState(() {
                                          _email = value;
                                        });

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
                                      setState(() {
                                        _password = value;
                                      });

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
                                            register(context);
                                          },
                                          child: Text(
                                            "انشاء حساب",
                                            style: TextStyle(
                                                fontFamily: 'Tajawal',
                                                fontSize: 16.5),
                                          ))),
                                ),

                                //forget password
                                   Container(
                                     height: MediaQuery.of(context).size.height/43 ,
                                   ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      " لديك حساب؟",
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
                                          "تسجيل دخول",
                                          style: TextStyle(
                                            color: HexColor('#1982C4'),
                                            fontSize: 14,
                                            fontFamily: 'Tajawal',
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>Login()),
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
    ));
  }

  bool validateForRegister(){
    if(_fName!=null&&_lName!=null&&_email!=null&&_password!=null&&phoneNumber!=null&&_fName.isNotEmpty&&_lName.isNotEmpty&&
    _email.isNotEmpty&&_password.isNotEmpty&&phoneNumber.isNotEmpty
    ){
      validatedString  = validation();
      return true;
    }else{
      return false ;
    }
  }
 void register(context){
    Commons.checkInternetConnectionn().then((value) => {
    if(Commons.connected){
        if(validateForRegister()){
   pr = new ProgressDialog(context,
   showLogs: true,
   isDismissible: true),
   pr.style(
   message: 'انتظر من فضلك...'),
   pr.show(),

   ApiServices.rigester(_fName,_lName,_email,phoneNumber
   , _password).then((value) => {

   if (ApiServices.goRegistered) {
   Commons.USERTOKEN=ApiServices.registerResponse.user_token,

   ApiServices.getProfileData(Commons.USERTOKEN).then((value) => {
   //print('user taken is ${ApiServices.loginResponse.user_token}');
   pr.hide(),
   print('navigate'),
   Navigator.pushReplacement(
   context,
   MaterialPageRoute(builder: (context) =>HomePage()),
   )}),
   } else {
   //request  done ok but error massege
   //gologin false
   print('null'),
   pr.hide(),
   Toast.show(
   "sorry${ApiServices.registerResponse.msg}",
   context,
   duration: Toast.LENGTH_LONG,
   gravity: Toast.BOTTOM,backgroundColor: Colors.indigo)



   }
   }),
   }else if(!validateForRegister()&&validatedString==null) {
   Toast.show(
   "من فضلك ادخل كل البيانات",
   context,
   duration: Toast.LENGTH_LONG,
   gravity: Toast.BOTTOM, backgroundColor: Colors.indigo),
   }else{
   Toast.show(
   validatedString,
   context,
   duration: Toast.LENGTH_LONG,
   gravity: Toast.BOTTOM, backgroundColor: Colors.indigo),
   }
   }else{
   Toast.show(
   "من فضلك اتصل بالانترنت",
   context,
   duration: Toast.LENGTH_LONG,
   gravity: Toast.BOTTOM,),
   }
    });


  }

  validation() {
    if(!(_email.contains("@")))
    {
      return"ادخل ايميلا صحيحا";
    }
    if(_password.length<6){
      return "لابد ان يكون الباسورد اكثر من6أحرف";
    }
    if(phoneNumber.length<12){
      return "لابد ان يكون رقم الهاتف صحيحا";
    }


    return null;
  }


 }

