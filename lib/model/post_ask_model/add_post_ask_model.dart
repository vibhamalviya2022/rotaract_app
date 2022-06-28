class AddPostAskModel {
  bool? isSuccess;
  Data? data;
  String? message;

  AddPostAskModel({this.isSuccess, this.data, this.message});

  AddPostAskModel.fromJson(Map<String, dynamic> json) {
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
  String? description;
  String? link;
  List<String>? dateTime;
  String? title;
  String? askDate;
  String? closeDate;
  String? sId;
  int? iV;

  Data(
      {this.description,
        this.link,
        this.dateTime,
        this.title,
        this.askDate,
        this.closeDate,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    link = json['link'];
    dateTime = json['dateTime'].cast<String>();
    title = json['title'];
    askDate = json['askDate'];
    closeDate = json['closeDate'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['link'] = this.link;
    data['dateTime'] = this.dateTime;
    data['title'] = this.title;
    data['askDate'] = this.askDate;
    data['closeDate'] = this.closeDate;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
