class AddNewOtherMemberBlood {
  bool? isSuccess;
  Data? data;
  String? message;

  AddNewOtherMemberBlood({this.isSuccess, this.data, this.message});

  AddNewOtherMemberBlood.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  String? name;
  String? phone;
  String? gender;
  String? weight;
  String? age;
  String? bloodGroup;
  String? relation;
  String? memberId;
  String? reqId;
  String? sId;
  int? iV;

  Data(
      {this.name,
        this.phone,
        this.gender,
        this.weight,
        this.age,
        this.bloodGroup,
        this.relation,
        this.memberId,
        this.reqId,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    weight = json['weight'];
    age = json['age'];
    bloodGroup = json['bloodGroup'];
    relation = json['relation'];
    memberId = json['memberId'];
    reqId = json['reqId'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['bloodGroup'] = this.bloodGroup;
    data['relation'] = this.relation;
    data['memberId'] = this.memberId;
    data['reqId'] = this.reqId;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
