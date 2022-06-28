class getOtherReqBloodModel {
  bool? isSuccess;
  List<OtherDataList>? data;
  String? message;

  getOtherReqBloodModel({this.isSuccess, this.data, this.message});

  getOtherReqBloodModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <OtherDataList>[];
      json['Data'].forEach((v) {
        data!.add( OtherDataList.fromJson(v));
      });
    }
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.message;
    return data;
  }
}

class OtherDataList {
  String? sId;
  String? name;
  String? phone;
  String? gender;
  String? weight;
  String? age;
  String? bloodGroup;
  String? relation;
  String? memberId;
  String? reqId;
  int? iV;
  // List<Null>? memberDetails;
  // List<Null>? requestbloodsDetails;
  List<BloodgroupDetails>? bloodgroupDetails;

  OtherDataList(
      {this.sId,
        this.name,
        this.phone,
        this.gender,
        this.weight,
        this.age,
        this.bloodGroup,
        this.relation,
        this.memberId,
        this.reqId,
        this.iV,
        // this.memberDetails,
        // this.requestbloodsDetails,
        this.bloodgroupDetails});

  OtherDataList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    weight = json['weight'];
    age = json['age'];
    bloodGroup = json['bloodGroup'];
    relation = json['relation'];
    memberId = json['memberId'];
    reqId = json['reqId'];
    iV = json['__v'];
    // if (json['memberDetails'] != null) {
    //   memberDetails = <Null>[];
    //   json['memberDetails'].forEach((v) {
    //     memberDetails!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['requestbloodsDetails'] != null) {
    //   requestbloodsDetails = <Null>[];
    //   json['requestbloodsDetails'].forEach((v) {
    //     requestbloodsDetails!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['bloodgroupDetails'] != null) {
      bloodgroupDetails = <BloodgroupDetails>[];
      json['bloodgroupDetails'].forEach((v) {
        bloodgroupDetails!.add(new BloodgroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['weight'] = this.weight;
    data['age'] = this.age;
    data['bloodGroup'] = this.bloodGroup;
    data['relation'] = this.relation;
    data['memberId'] = this.memberId;
    data['reqId'] = this.reqId;
    data['__v'] = this.iV;
    // if (this.memberDetails != null) {
    //   data['memberDetails'] =
    //       this.memberDetails!.map((v) => v.toJson()).toList();
    // }
    // if (this.requestbloodsDetails != null) {
    //   data['requestbloodsDetails'] =
    //       this.requestbloodsDetails!.map((v) => v.toJson()).toList();
    // }
    if (this.bloodgroupDetails != null) {
      data['bloodgroupDetails'] =
          this.bloodgroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloodgroupDetails {
  String? sId;
  String? group;
  int? iV;

  BloodgroupDetails({this.sId, this.group, this.iV});

  BloodgroupDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    group = json['group'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['group'] = this.group;
    data['__v'] = this.iV;
    return data;
  }
}
