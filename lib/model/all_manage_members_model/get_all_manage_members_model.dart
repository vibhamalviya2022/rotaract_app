class GetAllManageMembersModel {
  bool? isSuccess;
  int? count;
  List<MemberDataList>? data;
  String? message;

  GetAllManageMembersModel(
      {this.isSuccess, this.count, this.data, this.message});

  GetAllManageMembersModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <MemberDataList>[];
      json['Data'].forEach((v) {
        data!.add(new MemberDataList.fromJson(v));
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

class MemberDataList {
  String? sId;
  String? memberId;
  String? chapterId;
  String? memberStatus;
  int? iV;
  List<Managemember>? managemember;
  List<ManagememberChapterId>? managememberChapterId;
  // List<MemberStatusDetails>? memberStatusDetails;
  List<Cities>? cities;
  List<States>? states;
  List<Countries>? countries;

  MemberDataList(
      {this.sId,
        this.memberId,
        this.chapterId,
        this.memberStatus,
        this.iV,
        this.managemember,
        this.managememberChapterId,
        // this.memberStatusDetails,
        this.cities,
        this.states,
        this.countries});

  MemberDataList.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    memberId = json['memberId'];
    chapterId = json['chapterId'];
    memberStatus = json['memberStatus'];
    iV = json['__v'];
    if (json['managemember'] != null) {
      managemember = <Managemember>[];
      json['managemember'].forEach((v) {
        managemember!.add(new Managemember.fromJson(v));
      });
    }
    if (json['managememberChapterId'] != null) {
      managememberChapterId = <ManagememberChapterId>[];
      json['managememberChapterId'].forEach((v) {
        managememberChapterId!.add(new ManagememberChapterId.fromJson(v));
      });
    }
    if (json['memberStatusDetails'] != null) {
      // memberStatusDetails = <MemberStatusDetails>[];
      json['memberStatusDetails'].forEach((v) {
        // memberStatusDetails!.add(new MemberStatusDetails.fromJson(v));
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
    data['memberId'] = this.memberId;
    data['chapterId'] = this.chapterId;
    data['memberStatus'] = this.memberStatus;
    data['__v'] = this.iV;
    if (this.managemember != null) {
      data['managemember'] = this.managemember!.map((v) => v.toJson()).toList();
    }
    if (this.managememberChapterId != null) {
      data['managememberChapterId'] =
          this.managememberChapterId!.map((v) => v.toJson()).toList();
    }
    // if (this.memberStatusDetails != null) {
    //   data['memberStatusDetails'] =
          // this.memberStatusDetails!.map((v) => v.toJson()).toList();
    // }
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

class Managemember {
  String? sId;
  String? name;
  String? fatherName;
  String? surname;
  List<Null>? profileImage;
  String? adharCard;
  String? pincode;
  String? tshirtSize;
  String? village;
  String? taluka;
  String? district;
  String? instagramId;
  String? facebookId;
  String? dob;
  String? gender;
  String? age;
  String? anniversary;
  String? address;
  String? spouseName;
  String? spouseDob;
  String? noOfChild;
  String? bloodGroup;
  int? leader;
  String? phoneNumber;
  String? cityId;
  String? stateId;
  String? countryId;
  int? memeberStutes;
  String? companyName;
  String? businessCategory;
  String? businessAddress;
  String? occupation;
  String? post;
  String? aboutBusiness;
  String? keyword;
  String? website;
  String? email;
  String? achievement;
  String? experience;
  String? askOfWork;
  String? askForPeople;
  String? introducer;
  int? isAdmin;
  String? userName;
  String? membershipType;
  String? qualification;
  String? idProof;
  String? membershipTypeFoeRIYear;
  String? stream;
  String? collageNames;
  String? runningYear;
  String? studentCollegeIdPhotoProof;
  String? spouseContactNumber;
  String? spouseInstagramId;
  String? spouseBloodGroup;
  String? spouseFacebookId;
  String? spouseTShirtSize;
  String? paymentScreenShot;
  String? whyDoYouWantToJoinRotaractClub;
  int? iV;

  Managemember(
      {this.sId,
        this.name,
        this.fatherName,
        this.surname,
        this.profileImage,
        this.adharCard,
        this.pincode,
        this.tshirtSize,
        this.village,
        this.taluka,
        this.district,
        this.instagramId,
        this.facebookId,
        this.dob,
        this.gender,
        this.age,
        this.anniversary,
        this.address,
        this.spouseName,
        this.spouseDob,
        this.noOfChild,
        this.bloodGroup,
        this.leader,
        this.phoneNumber,
        this.cityId,
        this.stateId,
        this.countryId,
        this.memeberStutes,
        this.companyName,
        this.businessCategory,
        this.businessAddress,
        this.occupation,
        this.post,
        this.aboutBusiness,
        this.keyword,
        this.website,
        this.email,
        this.achievement,
        this.experience,
        this.askOfWork,
        this.askForPeople,
        this.introducer,
        this.isAdmin,
        this.userName,
        this.membershipType,
        this.qualification,
        this.idProof,
        this.membershipTypeFoeRIYear,
        this.stream,
        this.collageNames,
        this.runningYear,
        this.studentCollegeIdPhotoProof,
        this.spouseContactNumber,
        this.spouseInstagramId,
        this.spouseBloodGroup,
        this.spouseFacebookId,
        this.spouseTShirtSize,
        this.paymentScreenShot,
        this.whyDoYouWantToJoinRotaractClub,
        this.iV});

  Managemember.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    fatherName = json['fatherName'];
    surname = json['surname'];
    if (json['profileImage'] != null) {
      profileImage = <Null>[];
      json['profileImage'].forEach((v) {
        // profileImage!.add(new Null.fromJson(v));
      });
    }
    adharCard = json['adharCard'];
    pincode = json['pincode'];
    tshirtSize = json['tshirtSize'];
    village = json['village'];
    taluka = json['taluka'];
    district = json['district'];
    instagramId = json['instagramId'];
    facebookId = json['facebookId'];
    dob = json['dob'];
    gender = json['gender'];
    age = json['age'];
    anniversary = json['anniversary'];
    address = json['address'];
    spouseName = json['spouseName'];
    spouseDob = json['spouseDob'];
    noOfChild = json['noOfChild'];
    bloodGroup = json['bloodGroup'];
    leader = json['leader'];
    phoneNumber = json['phoneNumber'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    memeberStutes = json['memeberStutes'];
    companyName = json['companyName'];
    businessCategory = json['businessCategory'];
    businessAddress = json['businessAddress'];
    occupation = json['occupation'];
    post = json['post'];
    aboutBusiness = json['aboutBusiness'];
    keyword = json['keyword'];
    website = json['website'];
    email = json['email'];
    achievement = json['achievement'];
    experience = json['experience'];
    askOfWork = json['askOfWork'];
    askForPeople = json['askForPeople'];
    introducer = json['introducer'];
    isAdmin = json['isAdmin'];
    userName = json['userName'];
    membershipType = json['membershipType'];
    qualification = json['qualification'];
    idProof = json['idProof'];
    membershipTypeFoeRIYear = json['membershipTypeFoeRIYear'];
    stream = json['stream'];
    collageNames = json['collageNames'];
    runningYear = json['runningYear'];
    studentCollegeIdPhotoProof = json['studentCollegeIdPhotoProof'];
    spouseContactNumber = json['spouseContactNumber'];
    spouseInstagramId = json['spouseInstagramId'];
    spouseBloodGroup = json['spouseBloodGroup'];
    spouseFacebookId = json['spouseFacebookId'];
    spouseTShirtSize = json['spouseTShirtSize'];
    paymentScreenShot = json['paymentScreenShot'];
    whyDoYouWantToJoinRotaractClub = json['whyDoYouWantToJoinRotaractClub'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['fatherName'] = this.fatherName;
    data['surname'] = this.surname;
    if (this.profileImage != null) {
      // data['profileImage'] = this.profileImage!.map((v) => v.toJson()).toList();
    }
    data['adharCard'] = this.adharCard;
    data['pincode'] = this.pincode;
    data['tshirtSize'] = this.tshirtSize;
    data['village'] = this.village;
    data['taluka'] = this.taluka;
    data['district'] = this.district;
    data['instagramId'] = this.instagramId;
    data['facebookId'] = this.facebookId;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['anniversary'] = this.anniversary;
    data['address'] = this.address;
    data['spouseName'] = this.spouseName;
    data['spouseDob'] = this.spouseDob;
    data['noOfChild'] = this.noOfChild;
    data['bloodGroup'] = this.bloodGroup;
    data['leader'] = this.leader;
    data['phoneNumber'] = this.phoneNumber;
    data['cityId'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['memeberStutes'] = this.memeberStutes;
    data['companyName'] = this.companyName;
    data['businessCategory'] = this.businessCategory;
    data['businessAddress'] = this.businessAddress;
    data['occupation'] = this.occupation;
    data['post'] = this.post;
    data['aboutBusiness'] = this.aboutBusiness;
    data['keyword'] = this.keyword;
    data['website'] = this.website;
    data['email'] = this.email;
    data['achievement'] = this.achievement;
    data['experience'] = this.experience;
    data['askOfWork'] = this.askOfWork;
    data['askForPeople'] = this.askForPeople;
    data['introducer'] = this.introducer;
    data['isAdmin'] = this.isAdmin;
    data['userName'] = this.userName;
    data['membershipType'] = this.membershipType;
    data['qualification'] = this.qualification;
    data['idProof'] = this.idProof;
    data['membershipTypeFoeRIYear'] = this.membershipTypeFoeRIYear;
    data['stream'] = this.stream;
    data['collageNames'] = this.collageNames;
    data['runningYear'] = this.runningYear;
    data['studentCollegeIdPhotoProof'] = this.studentCollegeIdPhotoProof;
    data['spouseContactNumber'] = this.spouseContactNumber;
    data['spouseInstagramId'] = this.spouseInstagramId;
    data['spouseBloodGroup'] = this.spouseBloodGroup;
    data['spouseFacebookId'] = this.spouseFacebookId;
    data['spouseTShirtSize'] = this.spouseTShirtSize;
    data['paymentScreenShot'] = this.paymentScreenShot;
    data['whyDoYouWantToJoinRotaractClub'] =
        this.whyDoYouWantToJoinRotaractClub;
    data['__v'] = this.iV;
    return data;
  }
}

class ManagememberChapterId {
  String? sId;
  String? name;
  int? iV;

  ManagememberChapterId({this.sId, this.name, this.iV});

  ManagememberChapterId.fromJson(Map<String, dynamic> json) {
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

// class GetAllManageMembersModel {
//   bool? isSuccess;
//   int? count;
//   List<MemberDataList>? data;
//   String? message;
//
//   GetAllManageMembersModel(
//       {this.isSuccess, this.count, this.data, this.message});
//
//   GetAllManageMembersModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['IsSuccess'];
//     count = json['count'];
//     if (json['Data'] != null) {
//       data = <MemberDataList>[];
//       json['Data'].forEach((v) {
//         data!.add(new MemberDataList.fromJson(v));
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
// class MemberDataList {
//   String? sId;
//   String? memberId;
//   String? chapterId;
//   int? memberState;
//   String? leader;
//   int? iV;
//   String? memberStatus;
//   List<Managemember>? managemember;
//   List<ManagememberChapterId>? managememberChapterId;
//   // List<MemberStatusDetails>? memberStatusDetails;
//
//   MemberDataList(
//       {this.sId,
//         this.memberId,
//         this.chapterId,
//         this.memberState,
//         this.leader,
//         this.iV,
//         this.memberStatus,
//         this.managemember,
//         this.managememberChapterId,
//       //  this.memberStatusDetails
//       });
//
//   MemberDataList.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     memberId = json['memberId'];
//     chapterId = json['chapterId'];
//     memberState = json['memberState'];
//     leader = json['leader'];
//     iV = json['__v'];
//     memberStatus = json['memberStatus'];
//     if (json['managemember'] != null) {
//       managemember = <Managemember>[];
//       json['managemember'].forEach((v) {
//         managemember!.add(new Managemember.fromJson(v));
//       });
//     }
//     if (json['managememberChapterId'] != null) {
//       managememberChapterId = <ManagememberChapterId>[];
//       json['managememberChapterId'].forEach((v) {
//         managememberChapterId!.add(new ManagememberChapterId.fromJson(v));
//       });
//     }
//     if (json['memberStatusDetails'] != null) {
//       // memberStatusDetails = <MemberStatusDetails>[];
//       json['memberStatusDetails'].forEach((v) {
//         // memberStatusDetails!.add(new MemberStatusDetails.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['memberId'] = this.memberId;
//     data['chapterId'] = this.chapterId;
//     data['memberState'] = this.memberState;
//     data['leader'] = this.leader;
//     data['__v'] = this.iV;
//     data['memberStatus'] = this.memberStatus;
//     if (this.managemember != null) {
//       data['managemember'] = this.managemember!.map((v) => v.toJson()).toList();
//     }
//     if (this.managememberChapterId != null) {
//       data['managememberChapterId'] =
//           this.managememberChapterId!.map((v) => v.toJson()).toList();
//     }
//    /* if (this.memberStatusDetails != null) {
//       data['memberStatusDetails'] =
//           this.memberStatusDetails!.map((v) => v.toJson()).toList();
//     }*/
//     return data;
//   }
// }
//
// class Managemember {
//   var sId;
//   var sV;
//   String? aboutBusiness;
//   String? achievement;
//   String? address;
//   String? adharCard;
//   var age;
//   String? anniversary;
//   String? askForPeople;
//   String? askOfWork;
//   String? bloodGroup;
//   String? businessAddress;
//   String? businessCategory;
//   String? chapterId;
//   String? cityId;
//   String? companyName;
//   String? countryId;
//   String? district;
//   String? dob;
//   String? email;
//   String? experience;
//   String? facebookId;
//   String? fatherName;
//   String? gender;
//   String? instagramId;
//   String? introducer;
//   var isAdmin;
//   String? keyword;
//   var lat;
//   var leader;
//   var long;
//   var memeberStutes;
//   var name;
//   var noOfChild;
//   var phoneNumber;
//   var pincode;
//   var post;
//   var profileImage;
//   var spouseDob;
//   String? spouseName;
//   String? stateId;
//   String? surname;
//   String? taluka;
//   String? tshirtSize;
//   String? village;
//   String? website;
//
//   Managemember(
//       {this.sId,
//         this.sV,
//         this.aboutBusiness,
//         this.achievement,
//         this.address,
//         this.adharCard,
//         this.age,
//         this.anniversary,
//         this.askForPeople,
//         this.askOfWork,
//         this.bloodGroup,
//         this.businessAddress,
//         this.businessCategory,
//         this.chapterId,
//         this.cityId,
//         this.companyName,
//         this.countryId,
//         this.district,
//         this.dob,
//         this.email,
//         this.experience,
//         this.facebookId,
//         this.fatherName,
//         this.gender,
//         this.instagramId,
//         this.introducer,
//         this.isAdmin,
//         this.keyword,
//         this.lat,
//         this.leader,
//         this.long,
//         this.memeberStutes,
//         this.name,
//         this.noOfChild,
//         this.phoneNumber,
//         this.pincode,
//         this.post,
//         this.profileImage,
//         this.spouseDob,
//         this.spouseName,
//         this.stateId,
//         this.surname,
//         this.taluka,
//         this.tshirtSize,
//         this.village,
//         this.website});
//
//   Managemember.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     sV = json['__v'];
//     aboutBusiness = json['aboutBusiness'];
//     achievement = json['achievement'];
//     address = json['address'];
//     adharCard = json['adharCard'];
//     age = json['age'];
//     anniversary = json['anniversary'];
//     askForPeople = json['askForPeople'];
//     askOfWork = json['askOfWork'];
//     bloodGroup = json['bloodGroup'];
//     businessAddress = json['businessAddress'];
//     businessCategory = json['businessCategory'];
//     chapterId = json['chapterId'];
//     cityId = json['cityId'];
//     companyName = json['companyName'];
//     countryId = json['countryId'];
//     district = json['district'];
//     dob = json['dob'];
//     email = json['email'];
//     experience = json['experience'];
//     facebookId = json['facebookId'];
//     fatherName = json['fatherName'];
//     gender = json['gender'];
//     instagramId = json['instagramId'];
//     introducer = json['introducer'];
//     isAdmin = json['isAdmin'];
//     keyword = json['keyword'];
//     lat = json['lat'];
//     leader = json['leader'];
//     long = json['long'];
//     memeberStutes = json['memeberStutes'];
//     name = json['name'];
//     noOfChild = json['noOfChild'];
//     phoneNumber = json['phoneNumber'];
//     pincode = json['pincode'];
//     post = json['post'];
//     profileImage = json['profileImage'];
//     spouseDob = json['spouseDob'];
//     spouseName = json['spouseName'];
//     stateId = json['stateId'];
//     surname = json['surname'];
//     taluka = json['taluka'];
//     tshirtSize = json['tshirtSize'];
//     village = json['village'];
//     website = json['website'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['__v'] = this.sV;
//     data['aboutBusiness'] = this.aboutBusiness;
//     data['achievement'] = this.achievement;
//     data['address'] = this.address;
//     data['adharCard'] = this.adharCard;
//     data['age'] = this.age;
//     data['anniversary'] = this.anniversary;
//     data['askForPeople'] = this.askForPeople;
//     data['askOfWork'] = this.askOfWork;
//     data['bloodGroup'] = this.bloodGroup;
//     data['businessAddress'] = this.businessAddress;
//     data['businessCategory'] = this.businessCategory;
//     data['chapterId'] = this.chapterId;
//     data['cityId'] = this.cityId;
//     data['companyName'] = this.companyName;
//     data['countryId'] = this.countryId;
//     data['district'] = this.district;
//     data['dob'] = this.dob;
//     data['email'] = this.email;
//     data['experience'] = this.experience;
//     data['facebookId'] = this.facebookId;
//     data['fatherName'] = this.fatherName;
//     data['gender'] = this.gender;
//     data['instagramId'] = this.instagramId;
//     data['introducer'] = this.introducer;
//     data['isAdmin'] = this.isAdmin;
//     data['keyword'] = this.keyword;
//     data['lat'] = this.lat;
//     data['leader'] = this.leader;
//     data['long'] = this.long;
//     data['memeberStutes'] = this.memeberStutes;
//     data['name'] = this.name;
//     data['noOfChild'] = this.noOfChild;
//     data['phoneNumber'] = this.phoneNumber;
//     data['pincode'] = this.pincode;
//     data['post'] = this.post;
//     data['profileImage'] = this.profileImage;
//     data['spouseDob'] = this.spouseDob;
//     data['spouseName'] = this.spouseName;
//     data['stateId'] = this.stateId;
//     data['surname'] = this.surname;
//     data['taluka'] = this.taluka;
//     data['tshirtSize'] = this.tshirtSize;
//     data['village'] = this.village;
//     data['website'] = this.website;
//     return data;
//   }
// }
//
// class ManagememberChapterId {
//   String? sId;
//   String? name;
//   int? iV;
//
//   ManagememberChapterId({this.sId, this.name, this.iV});
//
//   ManagememberChapterId.fromJson(Map<String, dynamic> json) {
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
