class AllCountryModel {
  bool? isSuccess;
  List<CountryData>? data;
  int? count;
  String? message;

  AllCountryModel({this.isSuccess, this.data, this.count, this.message});

  AllCountryModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <CountryData>[];
      json['Data'].forEach((v) {
        data!.add( CountryData.fromJson(v));
      });
    }
    count = json['count'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['Message'] = this.message;
    return data;
  }
}

class CountryData {
  String? sId;
  String? countryName;
  int? iV;

  CountryData({this.sId, this.countryName, this.iV});

  CountryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    countryName = json['countryName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['countryName'] = this.countryName;
    data['__v'] = this.iV;
    return data;
  }
}
