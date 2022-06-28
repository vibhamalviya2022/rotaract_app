class AddJobModel {
  bool? isSuccess;
  JobData? data;
  String? message;

  AddJobModel({this.isSuccess, this.data, this.message});

  AddJobModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? new JobData.fromJson(json['Data']) : null;
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

class JobData {
  String? jobTitle;
  String? noOfPost;
  String? jobDescription;
  String? salary;
  String? jobType;
  String? remark;
  String? sId;
  int? iV;

  JobData(
      {this.jobTitle,
        this.noOfPost,
        this.jobDescription,
        this.salary,
        this.jobType,
        this.remark,
        this.sId,
        this.iV});

  JobData.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle'];
    noOfPost = json['noOfPost'];
    jobDescription = json['jobDescription'];
    salary = json['salary'];
    jobType = json['jobType'];
    remark = json['remark'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobTitle'] = this.jobTitle;
    data['noOfPost'] = this.noOfPost;
    data['jobDescription'] = this.jobDescription;
    data['salary'] = this.salary;
    data['jobType'] = this.jobType;
    data['remark'] = this.remark;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
