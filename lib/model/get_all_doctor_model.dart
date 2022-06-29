class GetAllDoctorModel {
  bool? isSuccess;
  int? count;
  List<GetAllDoctorData>? data;
  String? message;

  GetAllDoctorModel({this.isSuccess, this.count, this.data, this.message});

  GetAllDoctorModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <GetAllDoctorData>[];
      json['Data'].forEach((v) {
        data!.add(new GetAllDoctorData.fromJson(v));
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

class GetAllDoctorData {
  String? sId;
  String? name;
  String? lastName;
  String? hospitalName;
  String? phone;
  String? email;
  String? address;
  String? lat;
  String? long;
  String? city;
  String? state;
  String? country;
  String? description;
  List<String>? image;
  String? category;
  String? skill;
  String? subSkill;
  String? experience;
  int? iV;

  GetAllDoctorData(
      {this.sId,
        this.name,
        this.lastName,
        this.hospitalName,
        this.phone,
        this.email,
        this.address,
        this.lat,
        this.long,
        this.city,
        this.state,
        this.country,
        this.description,
        this.image,
        this.category,
        this.skill,
        this.subSkill,
        this.experience,
        this.iV});

  GetAllDoctorData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    lastName = json['lastName'];
    hospitalName = json['hospitalName'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    description = json['description'];
    image = json['image'].cast<String>();
    category = json['category'];
    skill = json['skill'];
    subSkill = json['subSkill'];
    experience = json['experience'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['hospitalName'] = this.hospitalName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['description'] = this.description;
    data['image'] = this.image;
    data['category'] = this.category;
    data['skill'] = this.skill;
    data['subSkill'] = this.subSkill;
    data['experience'] = this.experience;
    data['__v'] = this.iV;
    return data;
  }
}



// class GetAllDoctorModel {
//   bool? isSuccess;
//   int? count;
//   List<GetAllDoctorData>? data;
//   String? message;
//
//   GetAllDoctorModel({this.isSuccess, this.count, this.data, this.message});
//
//   GetAllDoctorModel.fromJson(Map<String, dynamic> json) {
//     isSuccess = json['IsSuccess'];
//     count = json['count'];
//     if (json['Data'] != null) {
//       data = <GetAllDoctorData>[];
//       json['Data'].forEach((v) {
//         data!.add(new GetAllDoctorData.fromJson(v));
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
// class GetAllDoctorData {
//   String? sId;
//   String? name;
//   String? lastName;
//   String? hospitalName;
//   String? phone;
//   String? email;
//   String? address;
//   String? lat;
//   String? long;
//   String? city;
//   String? state;
//   String? country;
//   String? description;
//   List<String>? image;
//   String? category;
//   String? skill;
//   String? subSkill;
//   String? experience;
//   int? iV;
//
//   GetAllDoctorData(
//       {this.sId,
//         this.name,
//         this.lastName,
//         this.hospitalName,
//         this.phone,
//         this.email,
//         this.address,
//         this.lat,
//         this.long,
//         this.city,
//         this.state,
//         this.country,
//         this.description,
//         this.image,
//         this.category,
//         this.skill,
//         this.subSkill,
//         this.experience,
//         this.iV});
//
//   GetAllDoctorData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     lastName = json['lastName'];
//     hospitalName = json['hospitalName'];
//     phone = json['phone'];
//     email = json['email'];
//     address = json['address'];
//     lat = json['lat'];
//     long = json['long'];
//     city = json['city'];
//     state = json['state'];
//     country = json['country'];
//     description = json['description'];
//     image = json['image'].cast<String>();
//     category = json['category'];
//     skill = json['skill'];
//     subSkill = json['subSkill'];
//     experience = json['experience'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['lastName'] = this.lastName;
//     data['hospitalName'] = this.hospitalName;
//     data['phone'] = this.phone;
//     data['email'] = this.email;
//     data['address'] = this.address;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['city'] = this.city;
//     data['state'] = this.state;
//     data['country'] = this.country;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     data['category'] = this.category;
//     data['skill'] = this.skill;
//     data['subSkill'] = this.subSkill;
//     data['experience'] = this.experience;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
