class BloodDonateDonarModel {
  bool? isSuccess;
  int? count;
  List<DonarDataList>? data;
  String? message;

  BloodDonateDonarModel({this.isSuccess, this.count, this.data, this.message});

  BloodDonateDonarModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <DonarDataList>[];
      json['Data'].forEach((v) {
        data!.add(new DonarDataList.fromJson(v));
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

class DonarDataList {
  String? sId;
  String? bloodGroup;
  String? name;
  String? phone;
  String? gender;
  String? age;
  String? lat;
  String? long;
  int? status;
  int? iV;

  DonarDataList(
      {this.sId,
        this.bloodGroup,
        this.name,
        this.phone,
        this.gender,
        this.age,
        this.lat,
        this.long,
        this.status,
        this.iV});

  DonarDataList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bloodGroup = json['bloodGroup'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    lat = json['lat'];
    long = json['long'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['bloodGroup'] = this.bloodGroup;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}
