
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart' as g;
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'networking/ApiServices.dart';
import 'networking/ProfileDataResponse.dart';
import 'networking/models/AllNeededResponse.dart';

class Commons {
 static Color accentColor = HexColor('#1982C4');
 static String USERTOKEN;
 static Color textblack = HexColor('#191919');
 static Color textHintColr = HexColor('#707070');
 static Color moveColor = HexColor('#6A4C93');
 static String allStatuseTitle = "حالات تحتاج مساعدتك";

 static AllNeededResponse allNeededResponse;
 static Position currentPosition;
 static ProfileDataResponse profileDataResponse;
 static bool connected=false;




 static void getProfiledata() {
  ApiServices.getProfileData(Commons.USERTOKEN);
 }

 String convertDateToForm(String createdAt) {
  var date = DateTime.parse(createdAt);
  var val = DateFormat("yyyy-MM-dd HH:mm").format(date);
// There is no timezone data associated with DateTime, so you have to use the following code to get the timezone info
  var offset = date.timeZoneOffset;
  var hours = offset.inHours > 0
      ? offset.inHours
      : 1; // For fixing divide by zero error
  /*if (!offset.isNegative) {
   val = val + "+" + offset.inHours.toString().padLeft(2, '0') + ":" + (offset.inMinutes%(hours*60)).toString().padLeft(2, '0');
  } else {
   val = val + offset.inHours.toString().padLeft(2, '0') + ":" + (offset.inMinutes%(hours*60)).toString().padLeft(2, '0');
  }*/
  return val;
 }
}
