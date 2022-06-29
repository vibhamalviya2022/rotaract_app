
class AddNewFeedBackDataModel {
  bool? isSuccess;
  AddNewFeedBackData? data;
  String? message;

  AddNewFeedBackDataModel({this.isSuccess, this.data, this.message});

  AddNewFeedBackDataModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new AddNewFeedBackData.fromJson(json['Data']) : null;
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

class AddNewFeedBackData {
  String? memberId;
  String? rating;
  String? description;
  String? sId;
  int? iV;

  AddNewFeedBackData({this.memberId, this.rating, this.description, this.sId, this.iV});

  AddNewFeedBackData.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    rating = json['rating'];
    description = json['description'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['memberId'] = this.memberId;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
