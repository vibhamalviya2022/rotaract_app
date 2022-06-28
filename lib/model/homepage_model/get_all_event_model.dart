class GetAllEventModel {
  bool? isSuccess;
  int? count;
  List<GetAllEventData>? data;
  String? message;

  GetAllEventModel({this.isSuccess, this.count, this.data, this.message});

  GetAllEventModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <GetAllEventData>[];
      json['Data'].forEach((v) {
        data!.add(new GetAllEventData.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['count'] = this.count;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class GetAllEventData {
  String? sId;
  String? title;
  String? date;
  String? address;
  String? description;
  String? time;
  String? organizer;
  String? lat;
  String? long;
  List<String>? image;
  String? phone;
  String? email;
  int? iV;
  String? endTime;

  GetAllEventData(
      {this.sId,
        this.title,
        this.date,
        this.address,
        this.description,
        this.time,
        this.organizer,
        this.lat,
        this.long,
        this.image,
        this.phone,
        this.email,
        this.iV,
        this.endTime});

  GetAllEventData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    address = json['address'];
    description = json['description'];
    time = json['time'];
    organizer = json['organizer'];
    lat = json['lat'];
    long = json['long'];
    image = json['image'].cast<String>();
    phone = json['phone'];
    email = json['email'];
    iV = json['__v'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['date'] = this.date;
    data['address'] = this.address;
    data['description'] = this.description;
    data['time'] = this.time;
    data['organizer'] = this.organizer;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['endTime'] = this.endTime;
    return data;
  }
}
