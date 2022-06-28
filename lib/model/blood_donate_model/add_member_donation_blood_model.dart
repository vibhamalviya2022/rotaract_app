class AddMemberDonationBlood {
  bool? isSuccess;
  DonarData? data;
  String? message;

  AddMemberDonationBlood({this.isSuccess, this.data, this.message});

  AddMemberDonationBlood.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ?  DonarData.fromJson(json['Data']) : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Message'] = this.message;
    return data;
  }
}

class DonarData {
  String? bloodGroup;
  String? name;
  String? phone;
  String? gender;
  String? age;
  String? lat;
  String? long;
  int? status;
  String? sId;
  int? iV;

  DonarData(
      {this.bloodGroup,
        this.name,
        this.phone,
        this.gender,
        this.age,
        this.lat,
        this.long,
        this.status,
        this.sId,
        this.iV});

  DonarData.fromJson(Map<String, dynamic> json) {
    bloodGroup = json['bloodGroup'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    age = json['age'];
    lat = json['lat'];
    long = json['long'];
    status = json['status'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bloodGroup'] = this.bloodGroup;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
