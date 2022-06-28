// class MemberProfileModel {
//   bool? isSuccess;
//   var count;
//   List<MemberData>? data;
//   String? message;
//
//   MemberProfileModel({this.isSuccess, this.count, this.data, this.message});
//
//   MemberProfileModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['IsSuccess'];
//     count = json['count'];
//     if (json['Data'] != null) {
//       data = <MemberData>[];
//       json['Data'].forEach((v) {
//         data!.add( MemberData.fromJson(v));
//       });
//     }
//     message = json['Message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data =  Map<String, dynamic>();
//     data['IsSuccess'] = this.isSuccess;
//     data['count'] = this.count;
//     if (this.data != null) {
//       data['Data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['Message'] = this.message;
//     return data;
//   }
// }
//
// class MemberData {
//   String? sId;
//   String? name;
//   List<Null>? profileImage;
//   var leader;
//   String? phoneNumber;
//   String? cityId;
//   String? stateId;
//   String? countryId;
//   String? email;
//   var dob;
//   var isAdmin;
//   var iV;
//   var gender;
//   var bloodGroup;
//   var anniversary;
//   var address;
//   var adharCard;
//   var tshirtSize;
//   var instagramId;
//   var facebookId;
//   var taluka;
//   var village;
//   var companyName;
//   var businessCategory;
//   var businessAddress;
//   var aboutBusiness;
//
//
//   // List<Null>? chapters;
//   // List<Null>? cities;
//   // List<Null>? states;
//   // List<Null>? countries;
//
//   MemberData(
//       {this.sId,
//         this.name,
//         this.profileImage,
//         this.leader,
//         this.phoneNumber,
//         this.cityId,
//         this.stateId,
//         this.countryId,
//         this.email,
//         this.isAdmin,
//         this.iV,
//         this.dob,
//         this.gender,
//         this.bloodGroup,
//         this.address,
//         this.adharCard,
//         this.anniversary,
//         this.facebookId,
//         this.instagramId,
//         this.tshirtSize,
//         this.taluka,
//         this.village,
//         this.companyName,
//         this.businessAddress,
//         this.businessCategory,
//         this.aboutBusiness
//         // this.chapters,
//         // this.cities,
//         // this.states,
//         // this.countries
//       });
//
//   MemberData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     if (json['profileImage'] != null) {
//       profileImage = <Null>[];
//       json['profileImage'].forEach((v) {
//         // profileImage!.add(Null.fromJson(v));
//       });
//     }
//     leader = json['leader'];
//     phoneNumber = json['phoneNumber'];
//     cityId = json['cityId'];
//     stateId = json['stateId'];
//     countryId = json['countryId'];
//     email = json['email'];
//     isAdmin = json['isAdmin'];
//     iV = json['__v'];
//     dob = json['dob'];
//     gender = json['gender'];
//     anniversary = json['anniversary'];
//     bloodGroup = json['bloodGroup'];
//     tshirtSize = json['tshirtSize'];
//     instagramId = json['instagramId'];
//     facebookId = json['facebookId'];
//     address = json['address'];
//     adharCard = json['adharCard'];
//     village = json["village"];
//     taluka = json["taluka"];
//     companyName = json['companyName'];
//     businessCategory = json['businessCategory'];
//     businessAddress = json['businessAddress'];
//     aboutBusiness = json['aboutBusiness'];
//
//
//     // if (json['cities'] != null) {
//     //   cities = <Null>[];
//     //   json['cities'].forEach((v) {
//     //     cities!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // if (json['states'] != null) {
//     //   states = <Null>[];
//     //   json['states'].forEach((v) {
//     //     states!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // if (json['countries'] != null) {
//     //   countries = <Null>[];
//     //   json['countries'].forEach((v) {
//     //     countries!.add(new Null.fromJson(v));
//     //   });
//     // }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     if (this.profileImage != null) {
//       // data['profileImage'] = this.profileImage!.map((v) => v.toJson()).toList();
//     }
//     data['leader'] = this.leader;
//     data['phoneNumber'] = this.phoneNumber;
//     data['cityId'] = this.cityId;
//     data['stateId'] = this.stateId;
//     data['countryId'] = this.countryId;
//     data['email'] = this.email;
//     data['isAdmin'] = this.isAdmin;
//     data['__v'] = this.iV;
//     data['dob'] = this.dob;
//     data['anniversary'] = this.anniversary;
//     data['gender'] = this.gender;
//     data['bloodGroup'] = this.bloodGroup;
//     data['tshirtSize'] =this.tshirtSize;
//     data['instagramId'] =this.instagramId;
//     data['facebookId'] = this.facebookId;
//     data['address'] =this.address;
//     data['adharCard'] =this.adharCard;
//     data['taluka'] = this.taluka;
//     data['village'] = this.village;
//     data['companyName'] = this.companyName;
//     data['businessCategory'] = this.businessCategory;
//     data['businessAddress'] = this.businessAddress;
//     data['aboutBusiness'] = this.aboutBusiness;
//
//     // if (this.cities != null) {
//     //   data['cities'] = this.cities!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.states != null) {
//     //   data['states'] = this.states!.map((v) => v.toJson()).toList();
//     // }
//     // if (this.countries != null) {
//     //   data['countries'] = this.countries!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }


class MemberProfileModel {
  bool? isSuccess;
  int? count;
  List<MemberData>? data;
  String? message;

  MemberProfileModel({this.isSuccess, this.count, this.data, this.message});

  MemberProfileModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <MemberData>[];
      json['Data'].forEach((v) {
        data!.add( MemberData.fromJson(v));
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

class MemberData {
  var sId;
  var sV;
  String? aboutBusiness;
  String? achievement;
  String? address;
  String? adharCard;
  var age;
  String? anniversary;
  String? askForPeople;
  String? askOfWork;
  String? bloodGroup;
  String? businessAddress;
  String? businessCategory;
  String? chapterId;
  String? cityId;
  String? companyName;
  String? countryId;
  String? district;
  String? dob;
  String? email;
  String? experience;
  String? facebookId;
  String? fatherName;
  String? gender;
  String? instagramId;
  String? introducer;
  var isAdmin;
  String? keyword;
  double? lat;
  var leader;
  double? long;
  var memeberStutes;
  String? name;
  String? noOfChild;
  String? phoneNumber;
  String? pincode;
  List<String>? profileImage;
  String? spouseDob;
  String? spouseName;
  String? stateId;
  String? surname;
  String? taluka;
  String? tshirtSize;
  String? village;
  String? website;
  List<Chapters>? chapters;
  List<Cities>? cities;
  List<States>? states;
  List<Countries>? countries;
  var occupation;

  MemberData(
      {this.sId,
        this.sV,
        this.aboutBusiness,
        this.achievement,
        this.address,
        this.adharCard,
        this.age,
        this.anniversary,
        this.askForPeople,
        this.askOfWork,
        this.bloodGroup,
        this.businessAddress,
        this.businessCategory,
        this.chapterId,
        this.cityId,
        this.companyName,
        this.countryId,
        this.district,
        this.dob,
        this.email,
        this.experience,
        this.facebookId,
        this.fatherName,
        this.gender,
        this.instagramId,
        this.introducer,
        this.isAdmin,
        this.keyword,
        this.lat,
        this.leader,
        this.long,
        this.memeberStutes,
        this.name,
        this.noOfChild,
        this.phoneNumber,
        this.pincode,
        this.profileImage,
        this.spouseDob,
        this.spouseName,
        this.stateId,
        this.surname,
        this.taluka,
        this.tshirtSize,
        this.village,
        this.website,
        this.chapters,
        this.cities,
        this.states,
        this.countries,this.occupation});

  MemberData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sV = json['__v'];
    aboutBusiness = json['aboutBusiness'];
    achievement = json['achievement'];
    address = json['address'];
    adharCard = json['adharCard'];
    age = json['age'];
    anniversary = json['anniversary'];
    askForPeople = json['askForPeople'];
    askOfWork = json['askOfWork'];
    bloodGroup = json['bloodGroup'];
    businessAddress = json['businessAddress'];
    businessCategory = json['businessCategory'];
    chapterId = json['chapterId'];
    cityId = json['cityId'];
    companyName = json['companyName'];
    countryId = json['countryId'];
    district = json['district'];
    dob = json['dob'];
    email = json['email'];
    experience = json['experience'];
    facebookId = json['facebookId'];
    fatherName = json['fatherName'];
    gender = json['gender'];
    instagramId = json['instagramId'];
    introducer = json['introducer'];
    isAdmin = json['isAdmin'];
    keyword = json['keyword'];
    lat = json['lat'];
    leader = json['leader'];
    long = json['long'];
    memeberStutes = json['memeberStutes'];
    name = json['name'];
    noOfChild = json['noOfChild'];
    phoneNumber = json['phoneNumber'];
    pincode = json['pincode'];
    profileImage = json['profileImage'].cast<String>();
    spouseDob = json['spouseDob'];
    spouseName = json['spouseName'];
    stateId = json['stateId'];
    surname = json['surname'];
    taluka = json['taluka'];
    tshirtSize = json['tshirtSize'];
    village = json['village'];
    website = json['website'];
    occupation = json['occupation'];

    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(new States.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['__v'] = this.sV;
    data['aboutBusiness'] = this.aboutBusiness;
    data['achievement'] = this.achievement;
    data['address'] = this.address;
    data['adharCard'] = this.adharCard;
    data['age'] = this.age;
    data['anniversary'] = this.anniversary;
    data['askForPeople'] = this.askForPeople;
    data['askOfWork'] = this.askOfWork;
    data['bloodGroup'] = this.bloodGroup;
    data['businessAddress'] = this.businessAddress;
    data['businessCategory'] = this.businessCategory;
    data['chapterId'] = this.chapterId;
    data['cityId'] = this.cityId;
    data['companyName'] = this.companyName;
    data['countryId'] = this.countryId;
    data['district'] = this.district;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['experience'] = this.experience;
    data['facebookId'] = this.facebookId;
    data['fatherName'] = this.fatherName;
    data['gender'] = this.gender;
    data['instagramId'] = this.instagramId;
    data['introducer'] = this.introducer;
    data['isAdmin'] = this.isAdmin;
    data['keyword'] = this.keyword;
    data['lat'] = this.lat;
    data['leader'] = this.leader;
    data['long'] = this.long;
    data['memeberStutes'] = this.memeberStutes;
    data['name'] = this.name;
    data['noOfChild'] = this.noOfChild;
    data['phoneNumber'] = this.phoneNumber;
    data['pincode'] = this.pincode;
    data['profileImage'] = this.profileImage;
    data['spouseDob'] = this.spouseDob;
    data['spouseName'] = this.spouseName;
    data['stateId'] = this.stateId;
    data['surname'] = this.surname;
    data['taluka'] = this.taluka;
    data['tshirtSize'] = this.tshirtSize;
    data['village'] = this.village;
    data['website'] = this.website;
    data['occupation'] = this.occupation;
    if (this.chapters != null) {
      data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Chapters {
  String? sId;
  String? name;
  int? iV;

  Chapters({this.sId, this.name, this.iV});

  Chapters.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}

class Cities {
  String? sId;
  String? cityName;
  String? stateId;
  String? countryId;
  int? iV;

  Cities({this.sId, this.cityName, this.stateId, this.countryId, this.iV});

  Cities.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cityName = json['cityName'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cityName'] = this.cityName;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['__v'] = this.iV;
    return data;
  }
}

class States {
  String? sId;
  String? stateName;
  String? countryId;
  int? iV;

  States({this.sId, this.stateName, this.countryId, this.iV});

  States.fromJson(Map<String, dynamic> json) {
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

class Countries {
  String? sId;
  String? countryName;
  int? iV;

  Countries({this.sId, this.countryName, this.iV});

  Countries.fromJson(Map<String, dynamic> json) {
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
