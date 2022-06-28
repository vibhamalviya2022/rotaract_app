class AllStateWithCountryId {
  bool? isSuccess;
  int? count;
  List<StateData>? data;
  String? message;

  AllStateWithCountryId({this.isSuccess, this.count, this.data, this.message});

  AllStateWithCountryId.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <StateData>[];
      json['Data'].forEach((v) {
        data!.add(new StateData.fromJson(v));
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

class StateData {
  String? sId;
  String? stateName;
  String? countryId;
  int? iV;

  StateData({this.sId, this.stateName, this.countryId, this.iV});

  StateData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    stateName = json['stateName'];
    countryId = json['countryId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['stateName'] = this.stateName;
    data['countryId'] = this.countryId;
    data['__v'] = this.iV;
    return data;
  }
}
