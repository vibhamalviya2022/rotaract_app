class AddNewMemberModel {
  bool? isSuccess;
  SignupData? data;
  String? message;

  AddNewMemberModel({this.isSuccess, this.data, this.message});

  AddNewMemberModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new SignupData.fromJson(json['Data']) : null;
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

class SignupData {
  String? name;
  String? fatherName;
  String? surname;
  List<String>? profileImage;
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
  String? chapterId;
  int? leader;
  String? phoneNumber;
  String? cityId;
  String? stateId;
  String? countryId;
  int? memeberStutes;
  String? companyName;
  String? businessCategory;
  String? businessAddress;
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
  double? lat;
  double? long;
  String? sId;
  int? iV;

  SignupData(
      {this.name,
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
        this.chapterId,
        this.leader,
        this.phoneNumber,
        this.cityId,
        this.stateId,
        this.countryId,
        this.memeberStutes,
        this.companyName,
        this.businessCategory,
        this.businessAddress,
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
        this.lat,
        this.long,
        this.sId,
        this.iV});

  SignupData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fatherName = json['fatherName'];
    surname = json['surname'];
    profileImage = json['profileImage'].cast<String>();
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
    chapterId = json['chapterId'];
    leader = json['leader'];
    phoneNumber = json['phoneNumber'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    memeberStutes = json['memeberStutes'];
    companyName = json['companyName'];
    businessCategory = json['businessCategory'];
    businessAddress = json['businessAddress'];
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
    lat = json['lat'];
    long = json['long'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fatherName'] = this.fatherName;
    data['surname'] = this.surname;
    data['profileImage'] = this.profileImage;
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
    data['chapterId'] = this.chapterId;
    data['leader'] = this.leader;
    data['phoneNumber'] = this.phoneNumber;
    data['cityId'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['memeberStutes'] = this.memeberStutes;
    data['companyName'] = this.companyName;
    data['businessCategory'] = this.businessCategory;
    data['businessAddress'] = this.businessAddress;
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
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
