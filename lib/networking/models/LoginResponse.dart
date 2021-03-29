class LoginResponse {
  bool status;
  String msg;
  String user_token;

  LoginResponse(this.status, this.msg, this.user_token);

  factory LoginResponse.decode(Map<dynamic, dynamic>json){
    return LoginResponse(json['status'], json['msg'], json['user_token']);
  }
}

