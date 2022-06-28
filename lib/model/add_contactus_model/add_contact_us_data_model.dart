class AddContactUsDataModel {
  bool? isSuccess;
  AddContactUsData? data;
  String? message;

  AddContactUsDataModel({this.isSuccess, this.data, this.message});

  AddContactUsDataModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new AddContactUsData.fromJson(json['Data']) : null;
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

class AddContactUsData {
  String? title;
  String? address;
  String? lat;
  String? description;
  String? email;
  String? website;
  String? sId;
  int? iV;

  AddContactUsData(
      {this.title,
        this.address,
        this.lat,
        this.description,
        this.email,
        this.website,
        this.sId,
        this.iV});

  AddContactUsData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    description = json['description'];
    email = json['email'];
    website = json['website'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['description'] = this.description;
    data['email'] = this.email;
    data['website'] = this.website;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
