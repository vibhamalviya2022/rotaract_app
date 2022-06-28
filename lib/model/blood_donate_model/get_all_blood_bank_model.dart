class GetAllBloodBankModel {
  bool? isSuccess;
  int? count;
  List<Data>? data;
  String? message;

  GetAllBloodBankModel({this.isSuccess, this.count, this.data, this.message});

  GetAllBloodBankModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? sId;
  String? name;
  String? area;
  String? state;
  String? city;
  String? phone;
  int? lat;
  int? long;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.area,
        this.state,
        this.city,
        this.phone,
        this.lat,
        this.long,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    area = json['area'];
    state = json['state'];
    city = json['city'];
    phone = json['phone'];
    lat = json['lat'];
    long = json['long'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['area'] = this.area;
    data['state'] = this.state;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['__v'] = this.iV;
    return data;
  }
}
