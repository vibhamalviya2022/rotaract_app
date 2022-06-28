class GetAllEventCalenderModel {
  bool? isSuccess;
  int? total;
  List<CalenderEventData>? data;
  String? message;

  GetAllEventCalenderModel(
      {this.isSuccess, this.total, this.data, this.message});

  GetAllEventCalenderModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    total = json['total'];
    if (json['Data'] != null) {
      data = <CalenderEventData>[];
      json['Data'].forEach((v) {
        data!.add(new CalenderEventData.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    data['total'] = this.total;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class CalenderEventData {
  String? date;
  var event;

  CalenderEventData({this.date, this.event});

  CalenderEventData.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    if (json['event'] != null) {
      event = <Event>[];
      json['event'].forEach((v) {
        event!.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.event != null) {
      data['event'] = this.event!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String? sId;
  String? title;
  String? date;
  String? address;
  String? description;
  String? time;
  String? endTime;
  String? organizer;
  String? lat;
  String? long;
  List<String>? image;
  String? phone;
  String? email;
  int? iV;

  Event(
      {this.sId,
        this.title,
        this.date,
        this.address,
        this.description,
        this.time,
        this.endTime,
        this.organizer,
        this.lat,
        this.long,
        this.image,
        this.phone,
        this.email,
        this.iV});

  Event.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    date = json['date'];
    address = json['address'];
    description = json['description'];
    time = json['time'];
    endTime = json['endTime'];
    organizer = json['organizer'];
    lat = json['lat'];
    long = json['long'];
    image = json['image'].cast<String>();
    phone = json['phone'];
    email = json['email'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['date'] = this.date;
    data['address'] = this.address;
    data['description'] = this.description;
    data['time'] = this.time;
    data['endTime'] = this.endTime;
    data['organizer'] = this.organizer;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['image'] = this.image;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['__v'] = this.iV;
    return data;
  }
}
