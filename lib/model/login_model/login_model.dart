class LoginModel {
  bool? isSuccess;
  List<LoginData>? data;
  String? Loginmessage;

  LoginModel({this.isSuccess, this.data, this.Loginmessage});

  LoginModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <LoginData>[];
      json['Data'].forEach((v) {
        data!.add(new LoginData.fromJson(v));
      });
    }
    Loginmessage = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccess'] = this.isSuccess;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['Message'] = this.Loginmessage;
    return data;
  }
}

class LoginData {
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
  var lat;
  var leader;
  var long;
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

  LoginData(
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
        this.website});

  LoginData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}


