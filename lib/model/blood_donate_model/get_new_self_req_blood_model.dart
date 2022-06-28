// class getNewSelfReqBloodModel {
//   bool? isSuccess;
//   List<SelfAllData>? data;
//   String? message;
//
//   getNewSelfReqBloodModel({this.isSuccess, this.data, this.message});
//
//   getNewSelfReqBloodModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['IsSuccess'];
//     if (json['Data'] != null) {
//       data = <SelfAllData>[];
//       json['Data'].forEach((v) {
//         data!.add(new SelfAllData.fromJson(v));
//       });
//     }
//     message = json['Message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['IsSuccess'] = this.isSuccess;
//     if (this.data != null) {
//       data['Data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['Message'] = this.message;
//     return data;
//   }
// }
//
// class SelfAllData {
//   String? sId;
//   String? bloodGroupId;
//   String? description;
//   int? userType;
//   int? status;
//   String? memberId;
//   List<String>? date;
//   int? iV;
//   List<MemberDetails>? memberDetails;
//
//   SelfAllData(
//       {this.sId,
//         this.bloodGroupId,
//         this.description,
//         this.userType,
//         this.status,
//         this.memberId,
//         this.date,
//         this.iV,
//         this.memberDetails});
//
//   SelfAllData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     bloodGroupId = json['bloodGroupId'];
//     description = json['description'];
//     userType = json['userType'];
//     status = json['status'];
//     memberId = json['memberId'];
//     date = json['date'].cast<String>();
//     iV = json['__v'];
//     if (json['memberDetails'] != null) {
//       memberDetails = <MemberDetails>[];
//       json['memberDetails'].forEach((v) {
//         memberDetails!.add(new MemberDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['bloodGroupId'] = this.bloodGroupId;
//     data['description'] = this.description;
//     data['userType'] = this.userType;
//     data['status'] = this.status;
//     data['memberId'] = this.memberId;
//     data['date'] = this.date;
//     data['__v'] = this.iV;
//     if (this.memberDetails != null) {
//       data['memberDetails'] =
//           this.memberDetails!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class MemberDetails {
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
//   int? isAdmin;
//   double? lat;
//   double? long;
//   int? iV;
//   String? post;
//
//   MemberDetails(
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
//         this.isAdmin,
//         this.lat,
//         this.long,
//         this.iV,
//         this.post});
//
//   MemberDetails.fromJson(Map<String, dynamic> json) {
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
//     isAdmin = json['isAdmin'];
//     lat = json['lat'];
//     long = json['long'];
//     iV = json['__v'];
//     post = json['post'];
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
//     data['isAdmin'] = this.isAdmin;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['__v'] = this.iV;
//     data['post'] = this.post;
//     return data;
//   }
// }
class getNewSelfReqBloodModel {
  bool? isSuccess;
  List<SelfAllData>? data;
  String? message;

  getNewSelfReqBloodModel({this.isSuccess, this.data, this.message});

  getNewSelfReqBloodModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <SelfAllData>[];
      json['Data'].forEach((v) {
        data!.add(new SelfAllData.fromJson(v));
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

class SelfAllData {
  String? sId;
  String? bloodGroupId;
  String? description;
  int? userType;
  int? status;
  String? memberId;
  List<String>? date;
  int? iV;
  List<MemberDetails>? memberDetails;

  SelfAllData(
      {this.sId,
        this.bloodGroupId,
        this.description,
        this.userType,
        this.status,
        this.memberId,
        this.date,
        this.iV,
        this.memberDetails});

  SelfAllData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    bloodGroupId = json['bloodGroupId'];
    description = json['description'];
    userType = json['userType'];
    status = json['status'];
    memberId = json['memberId'];
    date = json['date'].cast<String>();
    iV = json['__v'];
    if (json['memberDetails'] != null) {
      memberDetails = <MemberDetails>[];
      json['memberDetails'].forEach((v) {
        memberDetails!.add(new MemberDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['bloodGroupId'] = this.bloodGroupId;
    data['description'] = this.description;
    data['userType'] = this.userType;
    data['status'] = this.status;
    data['memberId'] = this.memberId;
    data['date'] = this.date;
    data['__v'] = this.iV;
    if (this.memberDetails != null) {
      data['memberDetails'] =
          this.memberDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberDetails {
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
  var gender;
  String? instagramId;
  String? introducer;
  var isAdmin;
  String? keyword;
  var lat;
  var leader;
  var long;
  var memeberStutes;
  String? name;
  String? noOfChild;
  String? phoneNumber;
  String? pincode;
  String? post;
  String? profileImage;
  String? spouseDob;
  String? spouseName;
  String? stateId;
  String? surname;
  String? taluka;
  String? tshirtSize;
  String? village;
  String? website;

  MemberDetails(
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
        this.post,
        // this.profileImage,
        this.spouseDob,
        this.spouseName,
        this.stateId,
        this.surname,
        this.taluka,
        this.tshirtSize,
        this.village,
        this.website});

  MemberDetails.fromJson(Map<String, dynamic> json) {
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
    post = json['post'];
    // profileImage = json['profileImage'];
    spouseDob = json['spouseDob'];
    spouseName = json['spouseName'];
    stateId = json['stateId'];
    surname = json['surname'];
    taluka = json['taluka'];
    tshirtSize = json['tshirtSize'];
    village = json['village'];
    website = json['website'];
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
    data['post'] = this.post;
    // data['profileImage'] = this.profileImage;
    data['spouseDob'] = this.spouseDob;
    data['spouseName'] = this.spouseName;
    data['stateId'] = this.stateId;
    data['surname'] = this.surname;
    data['taluka'] = this.taluka;
    data['tshirtSize'] = this.tshirtSize;
    data['village'] = this.village;
    data['website'] = this.website;
    return data;
  }
}
