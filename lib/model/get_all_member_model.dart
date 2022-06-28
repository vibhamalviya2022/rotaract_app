///Old Member Directory Used Model

// class GetAllMembersModel {
//   bool? isSuccess;
//   int? count;
//   List<GetAllMemberData>? data;
//   String? message;
//
//   GetAllMembersModel({this.isSuccess, this.count, this.data, this.message});
//
//   GetAllMembersModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['IsSuccess'];
//     count = json['count'];
//     if (json['Data'] != null) {
//       data = <GetAllMemberData>[];
//       json['Data'].forEach((v) {
//         data!.add(new GetAllMemberData.fromJson(v));
//       });
//     }
//     message = json['Message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
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
// class GetAllMemberData {
//   String? sId;
//   String? name;
//   String? fatherName;
//   String? surname;
//   List<String>? profileImage;
//   String? adharCard;
//   String? pincode;
//   String? tshirtSize;
//   String? village;
//   String? taluka;
//   String? district;
//   String? instagramId;
//   String? facebookId;
//   String? dob;
//   String? gender;
//   String? age;
//   String? anniversary;
//   String? address;
//   String? spouseName;
//   String? spouseDob;
//   String? noOfChild;
//   String? bloodGroup;
//   String? chapterId;
//   int? leader;
//   String? phoneNumber;
//   String? cityId;
//   String? stateId;
//   String? countryId;
//   int? memeberStutes;
//   String? companyName;
//   String? businessCategory;
//   String? businessAddress;
//   String? aboutBusiness;
//   String? keyword;
//   String? website;
//   String? email;
//   String? achievement;
//   String? experience;
//   String? askOfWork;
//   String? askForPeople;
//   String? introducer;
//   double? lat;
//   double? long;
//   int? iV;
//   List<Chapters>? chapters;
//   List<Cities>? cities;
//   List<States>? states;
//   List<Null>? countries;
//
//   GetAllMemberData(
//       {this.sId,
//         this.name,
//         this.fatherName,
//         this.surname,
//         this.profileImage,
//         this.adharCard,
//         this.pincode,
//         this.tshirtSize,
//         this.village,
//         this.taluka,
//         this.district,
//         this.instagramId,
//         this.facebookId,
//         this.dob,
//         this.gender,
//         this.age,
//         this.anniversary,
//         this.address,
//         this.spouseName,
//         this.spouseDob,
//         this.noOfChild,
//         this.bloodGroup,
//         this.chapterId,
//         this.leader,
//         this.phoneNumber,
//         this.cityId,
//         this.stateId,
//         this.countryId,
//         this.memeberStutes,
//         this.companyName,
//         this.businessCategory,
//         this.businessAddress,
//         this.aboutBusiness,
//         this.keyword,
//         this.website,
//         this.email,
//         this.achievement,
//         this.experience,
//         this.askOfWork,
//         this.askForPeople,
//         this.introducer,
//         this.lat,
//         this.long,
//         this.iV,
//         this.chapters,
//         this.cities,
//         this.states,
//         this.countries});
//
//   GetAllMemberData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     fatherName = json['fatherName'];
//     surname = json['surname'];
//     profileImage = json['profileImage'].cast<String>();
//     adharCard = json['adharCard'];
//     pincode = json['pincode'];
//     tshirtSize = json['tshirtSize'];
//     village = json['village'];
//     taluka = json['taluka'];
//     district = json['district'];
//     instagramId = json['instagramId'];
//     facebookId = json['facebookId'];
//     dob = json['dob'];
//     gender = json['gender'];
//     age = json['age'];
//     anniversary = json['anniversary'];
//     address = json['address'];
//     spouseName = json['spouseName'];
//     spouseDob = json['spouseDob'];
//     noOfChild = json['noOfChild'];
//     bloodGroup = json['bloodGroup'];
//     chapterId = json['chapterId'];
//     leader = json['leader'];
//     phoneNumber = json['phoneNumber'];
//     cityId = json['cityId'];
//     stateId = json['stateId'];
//     countryId = json['countryId'];
//     memeberStutes = json['memeberStutes'];
//     companyName = json['companyName'];
//     businessCategory = json['businessCategory'];
//     businessAddress = json['businessAddress'];
//     aboutBusiness = json['aboutBusiness'];
//     keyword = json['keyword'];
//     website = json['website'];
//     email = json['email'];
//     achievement = json['achievement'];
//     experience = json['experience'];
//     askOfWork = json['askOfWork'];
//     askForPeople = json['askForPeople'];
//     introducer = json['introducer'];
//     lat = json['lat'];
//     long = json['long'];
//     iV = json['__v'];
//     if (json['chapters'] != null) {
//       chapters = <Chapters>[];
//       json['chapters'].forEach((v) {
//         chapters!.add(new Chapters.fromJson(v));
//       });
//     }
//     if (json['cities'] != null) {
//       cities = <Cities>[];
//       json['cities'].forEach((v) {
//         cities!.add(new Cities.fromJson(v));
//       });
//     }
//     if (json['states'] != null) {
//       states = <States>[];
//       json['states'].forEach((v) {
//         states!.add(new States.fromJson(v));
//       });
//     }
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
//     data['fatherName'] = this.fatherName;
//     data['surname'] = this.surname;
//     data['profileImage'] = this.profileImage;
//     data['adharCard'] = this.adharCard;
//     data['pincode'] = this.pincode;
//     data['tshirtSize'] = this.tshirtSize;
//     data['village'] = this.village;
//     data['taluka'] = this.taluka;
//     data['district'] = this.district;
//     data['instagramId'] = this.instagramId;
//     data['facebookId'] = this.facebookId;
//     data['dob'] = this.dob;
//     data['gender'] = this.gender;
//     data['age'] = this.age;
//     data['anniversary'] = this.anniversary;
//     data['address'] = this.address;
//     data['spouseName'] = this.spouseName;
//     data['spouseDob'] = this.spouseDob;
//     data['noOfChild'] = this.noOfChild;
//     data['bloodGroup'] = this.bloodGroup;
//     data['chapterId'] = this.chapterId;
//     data['leader'] = this.leader;
//     data['phoneNumber'] = this.phoneNumber;
//     data['cityId'] = this.cityId;
//     data['stateId'] = this.stateId;
//     data['countryId'] = this.countryId;
//     data['memeberStutes'] = this.memeberStutes;
//     data['companyName'] = this.companyName;
//     data['businessCategory'] = this.businessCategory;
//     data['businessAddress'] = this.businessAddress;
//     data['aboutBusiness'] = this.aboutBusiness;
//     data['keyword'] = this.keyword;
//     data['website'] = this.website;
//     data['email'] = this.email;
//     data['achievement'] = this.achievement;
//     data['experience'] = this.experience;
//     data['askOfWork'] = this.askOfWork;
//     data['askForPeople'] = this.askForPeople;
//     data['introducer'] = this.introducer;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['__v'] = this.iV;
//     if (this.chapters != null) {
//       data['chapters'] = this.chapters!.map((v) => v.toJson()).toList();
//     }
//     if (this.cities != null) {
//       data['cities'] = this.cities!.map((v) => v.toJson()).toList();
//     }
//     if (this.states != null) {
//       data['states'] = this.states!.map((v) => v.toJson()).toList();
//     }
//     // if (this.countries != null) {
//     //   data['countries'] = this.countries!.map((v) => v.toJson()).toList();
//     // }
//     return data;
//   }
// }
//
// class Chapters {
//   String? sId;
//   String? name;
//   int? iV;
//
//   Chapters({this.sId, this.name, this.iV});
//
//   Chapters.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class Cities {
//   String? sId;
//   String? cityName;
//   String? stateId;
//   String? countryId;
//   int? iV;
//
//   Cities({this.sId, this.cityName, this.stateId, this.countryId, this.iV});
//
//   Cities.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     cityName = json['cityName'];
//     stateId = json['stateId'];
//     countryId = json['countryId'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['cityName'] = this.cityName;
//     data['stateId'] = this.stateId;
//     data['countryId'] = this.countryId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
//
// class States {
//   String? sId;
//   String? stateName;
//   String? countryId;
//   int? iV;
//
//   States({this.sId, this.stateName, this.countryId, this.iV});
//
//   States.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     stateName = json['stateName'];
//     countryId = json['countryId'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['stateName'] = this.stateName;
//     data['countryId'] = this.countryId;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
