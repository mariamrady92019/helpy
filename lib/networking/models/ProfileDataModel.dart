class ProfileDataModel
{
  int id;
  String fName;
  String lName;
  String email;
  String phone;
  String avatar;
  Null gender;
  Null country;
  Null city;
  Null address;
  String createdAt;
  String updatedAt;

  ProfileDataModel(
      {this.id,
        this.fName,
        this.lName,
        this.email,
        this.phone,
        this.avatar,
        this.gender,
        this.country,
        this.city,
        this.address,
        this.createdAt,
        this.updatedAt});

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    gender = json['gender'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}