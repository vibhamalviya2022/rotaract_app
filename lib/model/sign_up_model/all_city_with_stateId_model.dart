class AllCityWithStateIdModel {
  bool? isSuccess;
  int? count;
  List<CityData>? data;
  String? message;

  AllCityWithStateIdModel(
      {this.isSuccess, this.count, this.data, this.message});

  AllCityWithStateIdModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <CityData>[];
      json['Data'].forEach((v) {
        data!.add(new CityData.fromJson(v));
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

class CityData {
  String? sId;
  String? cityName;
  String? stateId;
  String? countryId;
  int? iV;
  List<StateDetails>? stateDetails;
  List<CountryDetails>? countryDetails;

  CityData(
      {this.sId,
        this.cityName,
        this.stateId,
        this.countryId,
        this.iV,
        this.stateDetails,
        this.countryDetails});

  CityData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['cityName'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    iV = json['__v'];
    if (json['stateDetails'] != null) {
      stateDetails = <StateDetails>[];
      json['stateDetails'].forEach((v) {
        stateDetails!.add(new StateDetails.fromJson(v));
      });
    }
    if (json['countryDetails'] != null) {
      countryDetails = <CountryDetails>[];
      json['countryDetails'].forEach((v) {
        countryDetails!.add(new CountryDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cityName'] = this.cityName;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['__v'] = this.iV;
    if (this.stateDetails != null) {
      data['stateDetails'] = this.stateDetails!.map((v) => v.toJson()).toList();
    }
    if (this.countryDetails != null) {
      data['countryDetails'] =
          this.countryDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StateDetails {
  String? sId;
  String? stateName;
  String? countryId;
  int? iV;

  StateDetails({this.sId, this.stateName, this.countryId, this.iV});

  StateDetails.fromJson(Map<String, dynamic> json) {
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

class CountryDetails {
  String? sId;
  String? countryName;
  int? iV;

  CountryDetails({this.sId, this.countryName, this.iV});

  CountryDetails.fromJson(Map<String, dynamic> json) {
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
