class AddNewSelfReqBloodModel {
  bool? isSuccess;
  Data? data;
  String? message;

  AddNewSelfReqBloodModel({this.isSuccess, this.data, this.message});

  AddNewSelfReqBloodModel.fromJson(Map<String, dynamic> json) {
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
  String? bloodGroupId;
  String? description;
  int? userType;
  int? status;
  String? memberId;
  List<String>? date;
  String? sId;
  int? iV;

  Data(
      {this.bloodGroupId,
        this.description,
        this.userType,
        this.status,
        this.memberId,
        this.date,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    bloodGroupId = json['bloodGroupId'];
    description = json['description'];
    userType = json['userType'];
    status = json['status'];
    memberId = json['memberId'];
    date = json['date'].cast<String>();
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bloodGroupId'] = this.bloodGroupId;
    data['description'] = this.description;
    data['userType'] = this.userType;
    data['status'] = this.status;
    data['memberId'] = this.memberId;
    data['date'] = this.date;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
