class DownloadModel {
  bool? isSuccess;
  int? count;
  List<Download>? data;
  String? message;

  DownloadModel({this.isSuccess, this.count, this.data, this.message});

  DownloadModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['IsSuccess'];
    count = json['count'];
    if (json['Data'] != null) {
      data = <Download>[];
      json['Data'].forEach((v) {
        data!.add(new Download.fromJson(v));
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

class Download {
  var title;
  String? sId;
  int? iV;
  String? files;

  Download({this.sId, this.iV, this.files,this.title});

  Download.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sId = json['_id'];
    iV = json['__v'];
    files = json['files'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    data['files'] = this.files;
    data['title'] = this.title;
    return data;
  }
}
