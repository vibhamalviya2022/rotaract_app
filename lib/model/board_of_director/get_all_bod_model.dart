class getAllBODModel {
  bool? isSuccess;
  int? count;
  List<BodData>? data;
  String? message;

  getAllBODModel({this.isSuccess, this.count, this.data, this.message});

  getAllBODModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <BodData>[];
      json['Data'].forEach((v) {
        data!.add(new BodData.fromJson(v));
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

class BodData {
  String? sId;
  String? memberId;
  int? iV;
  List<Managemember>? managemember;

  BodData({this.sId, this.memberId, this.iV, this.managemember});

  BodData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    memberId = json['memberId'];
    iV = json['__v'];
    if (json['managemember'] != null) {
      managemember = <Managemember>[];
      json['managemember'].forEach((v) {
        managemember!.add(new Managemember.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['memberId'] = this.memberId;
    data['__v'] = this.iV;
    if (this.managemember != null) {
      data['managemember'] = this.managemember!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Managemember {
  var sId;
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
  var gender;
  var age;
  String? anniversary;
  String? address;
  String? spouseName;
  String? spouseDob;
  String? noOfChild;
  String? bloodGroup;
  var leader;
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
  var isAdmin;
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
  var iV;

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
        // profileImage!.add( Null.fromJson(v));
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

