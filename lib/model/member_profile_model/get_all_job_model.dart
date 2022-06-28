class getAllJobModel {
  bool? isSuccess;
  int? count;
  List<JobAllGetData>? data;
  String? message;

  getAllJobModel({this.isSuccess, this.count, this.data, this.message});

  getAllJobModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <JobAllGetData>[];
      json['Data'].forEach((v) {
        data!.add(new JobAllGetData.fromJson(v));
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

class JobAllGetData {
  String? sId;
  String? jobTitle;
  String? noOfPost;
  String? jobDescription;
  String? salary;
  String? jobType;
  String? remark;
  int? iV;

  JobAllGetData(
      {this.sId,
        this.jobTitle,
        this.noOfPost,
        this.jobDescription,
        this.salary,
        this.jobType,
        this.remark,
        this.iV});

  JobAllGetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    jobTitle = json['jobTitle'];
    noOfPost = json['noOfPost'];
    jobDescription = json['jobDescription'];
    salary = json['salary'];
    jobType = json['jobType'];
    remark = json['remark'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['jobTitle'] = this.jobTitle;
    data['noOfPost'] = this.noOfPost;
    data['jobDescription'] = this.jobDescription;
    data['salary'] = this.salary;
    data['jobType'] = this.jobType;
    data['remark'] = this.remark;
    data['__v'] = this.iV;
    return data;
  }
}
