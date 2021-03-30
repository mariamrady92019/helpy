import 'models/ProfileDataModel.dart';

class ProfileDataResponse {
  bool status;
  ProfileDataModel data;

  ProfileDataResponse({this.status, this.data});

  ProfileDataResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ProfileDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

