class AllNeededResponse {
  List<Data> data;
Links links;
Meta meta;

AllNeededResponse({this.data, this.links, this.meta});

AllNeededResponse.fromJson(Map<String, dynamic> json) {
if (json['data'] != null) {
data = new List<Data>();
json['data'].forEach((v) {
data.add(new Data.fromJson(v));
});
}
links = json['links'] != null ? new Links.fromJson(json['links']) : null;
meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  if (this.data != null) {
    data['data'] = this.data.map((v) => v.toJson()).toList();
  }
  if (this.links != null) {
    data['links'] = this.links.toJson();
  }
  if (this.meta != null) {
    data['meta'] = this.meta.toJson();
  }
  return data;
}
}

class Data {
  int id;
  String user;
  String title;
  String gender;
  String mentalState;
  String adult;
  String description;
  String latitude;
  String longitude;
  String proof;
  String status;
  String createdAt;
  String updatedAt;
  NeededLinks links;

  Data(
      {this.id,
        this.user,
        this.title,
        this.gender,
        this.mentalState,
        this.adult,
        this.description,
        this.latitude,
        this.longitude,
        this.proof,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.links});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    title = json['title'];
    gender = json['gender'];
    mentalState = json['mental_state'];
    adult = json['adult'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    proof = json['proof'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    links = json['links'] != null ? new NeededLinks.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['title'] = this.title;
    data['gender'] = this.gender;
    data['mental_state'] = this.mentalState;
    data['adult'] = this.adult;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['proof'] = this.proof;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class NeededLinks {
  String help;
  String report;

  NeededLinks({this.help, this.report});

  NeededLinks.fromJson(Map<String, dynamic> json) {
    help = json['help'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['help'] = this.help;
    data['report'] = this.report;
    return data;
  }
}

class Links {
  String first;
  String last;
  String prev;
  String next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int currentPage;
  int from;
  String path;
  int perPage;
  int to;

  Meta({this.currentPage, this.from, this.path, this.perPage, this.to});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    return data;
  }
}
