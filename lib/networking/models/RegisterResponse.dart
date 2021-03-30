import 'package:helpy/views/Register.dart';

class RegisterResponse {
  bool status;
  String msg;
  String user_token;



  RegisterResponse(this.status, this.msg,this.user_token);

  factory RegisterResponse.decode(Map<dynamic, dynamic>json){
    return RegisterResponse(json['status'], json['msg'],json['user_token']);
  }
}

