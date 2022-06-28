class getAllPostAsk {
  bool? isSuccess;
  int? count;
  List<askData>? data;
  String? message;

  getAllPostAsk({this.isSuccess, this.count, this.data, this.message});

  getAllPostAsk.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <askData>[];
      json['Data'].forEach((v) {
        data!.add(new askData.fromJson(v));
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

class askData {
  String? sId;
  String? memberId;
  String? description;
  String? link;
  List<String>? dateTime;
  String? title;
  String? askDate;
  String? closeDate;
  int? iV;
  List<MemberDetails>? memberDetails;

  askData(
      {this.sId,
        this.memberId,
        this.description,
        this.link,
        this.dateTime,
        this.title,
        this.askDate,
        this.closeDate,
        this.iV,
        this.memberDetails});

  askData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    memberId = json['memberId'];
    description = json['description'];
    link = json['link'];
    dateTime = json['dateTime'].cast<String>();
    title = json['title'];
    askDate = json['askDate'];
    closeDate = json['closeDate'];
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
    data['memberId'] = this.memberId;
    data['description'] = this.description;
    data['link'] = this.link;
    data['dateTime'] = this.dateTime;
    data['title'] = this.title;
    data['askDate'] = this.askDate;
    data['closeDate'] = this.closeDate;
    data['__v'] = this.iV;
    if (this.memberDetails != null) {
      data['memberDetails'] =
          this.memberDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MemberDetails {
  String? sId;
  String? sV;
  String? achievement;
  String? address;
  String? adharCard;
  String? age;
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
  String? dob;
  String? email;
  String? experience;
  String? facebookId;
  String? fatherName;
  String? gender;
  String? instagramId;
  String? introducer;
  String? isAdmin;
  String? keyword;
  String? lat;
  String? leader;
  String? long;
  String? memeberStutes;
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
        this.profileImage,
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
    profileImage = json['profileImage'];
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
