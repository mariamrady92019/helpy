import 'package:helpy/views/Register.dart';

class RegisterResponse {
  bool status;
  String msg;



  RegisterResponse(this.status, this.msg);

  factory RegisterResponse.decode(Map<dynamic, dynamic>json){
    return RegisterResponse(json['status'], json['msg']);
  }
}

