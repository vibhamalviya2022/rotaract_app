import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rotaract_app/model/feedback_model/feedback_model.dart';
import 'package:rotaract_app/model/post_ask_model/get_all_ask_model.dart';
import '../model/all_manage_members_model/get_all_manage_members_model.dart';
import '../model/blood_donate_model/add_member_donation_blood_model.dart';
import '../model/blood_donate_model/add_new_other_member_blood.dart';
import '../model/blood_donate_model/add_new_self_req_blood_model.dart';
import '../model/blood_donate_model/blood_donate_donar_model.dart';
import '../model/blood_donate_model/get_all_blood_bank_model.dart';
import '../model/blood_donate_model/get_new_self_req_blood_model.dart';
import '../model/blood_donate_model/get_other_req_blood_model.dart';
import '../model/board_of_director/get_all_bod_model.dart';
import '../model/download_general_pdf_model/download_model.dart';
import '../model/get_all_doctor_model.dart';
import '../model/get_all_member_model.dart';
import '../model/homepage_model/get_all_event_model.dart';
import '../model/homepage_model/get_current_date_event_model.dart';
import '../model/login_model/login_model.dart';
import '../model/member_profile_model/add_job_model.dart';
import '../model/member_profile_model/get_all_job_model.dart';
import '../model/member_profile_model/member_profile_model.dart';
import '../model/member_profile_model/update_member_profile_model.dart';
import '../model/post_ask_model/add_post_ask_model.dart';
import '../model/sign_up_model/add_new_member.dart';
import '../model/sign_up_model/all_city_with_stateId_model.dart';
import '../model/sign_up_model/all_country_model.dart';
import '../model/sign_up_model/all_state_with_country_id.dart';
import '../shared_pfrefs_data/shared_prefs_data.dart';
import '../shared_pfrefs_data/shared_prefs_key.dart';

class Api {
  static String baseUrl = "https://rotarect.herokuapp.com/";

  ///Profile getMember Api
  static Future<MemberProfileModel?> memberProfileApi() async {
    var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
    print("memberID$memberId");
    var url = baseUrl + "members/getMember";
    var body = {"memberId": memberId};
    try {
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        print("Profile Data ${response.body}");
        return MemberProfileModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  static Future<GetAllEventModel?> getAllEventModelApi() async {
    var url = baseUrl + "admins/getAllEvent";
    print("getAllEventModelApi url $url");
    try {
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        print("getAllEventModelApi Data  body${response.body}");
        return GetAllEventModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///Home Page in Current Date in All Event Show  Api
  static Future<GetCurrentDateEventModel?> getAllcurrentEventModelApi(date) async {
    var url = baseUrl + "admins/getAllEventDate";
    var body = {
      "date": date
    };
    print("get Event Current Date url $url");
    try {
      var response = await http.post(Uri.parse(url),body: body);
      if (response.statusCode == 200) {
        print("Event Current Data  body${response.body}");
        return GetCurrentDateEventModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///Profile UpdateMemberProfile Api
  static Future<UpdateMemberProfileModel?> updateMemberProfileApi(
      bodyData) async {
    var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
    print("print Member data$memberId");
    var url = baseUrl + "members/updateMember";
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(url));
    request.body = bodyData;
    print("print Update body${request.body}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      print("response Update Profile$jsonD");
      return UpdateMemberProfileModel.fromJson(jsonD);
    } else {
      Fluttertoast.showToast(msg: response.reasonPhrase.toString());
      print(response.reasonPhrase);
    }
  }

  ///Add Job Data Api in Profile
  static Future<AddJobModel?> addJobDataApi(jobTitle,noOfPosition,jobDescription,jobType,salary,Remark) async {
    var url = baseUrl + "members/addNewJobPost";
    var body ={
      "jobTitle":jobTitle,
      "jobDescription": noOfPosition,
      "jobType": jobDescription,
      "remark": Remark,
      "salary": salary,
      "noOfPost": noOfPosition
    };
    print("get Event Current Date url $url");
    try {
      var response = await http.post(Uri.parse(url),body: body);
      if (response.statusCode == 200) {
        print("Event Current Data  body${response.body}");
        return AddJobModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///getAll Job api
  static Future<getAllJobModel?> getJobDataApi() async {
    var url = baseUrl + "members/getAllJobPost";

    print("get All job Date url $url");
    try {
      var response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        print("get All Data  body${response.body}");
        return getAllJobModel.fromJson(jsonDecode(response.body));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }


  ///Login Api
  static Future<LoginModel?> loginApi(mobileno) async {
    var url = baseUrl + 'members/memberLogin';
    print("loginApi url Data${url}");

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({"phoneNumber": mobileno});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(" loginApi is call response is :" + response.statusCode.toString());
    if (response.statusCode == 200) {
      print(" loginApi is call response under the 200 code  :  " + response.statusCode.toString());
      var jsonD = jsonDecode(await response.stream.bytesToString());
      print(" loginApi is call response is  the 200 code  after the jsonD:  " + jsonD.toString());
      return LoginModel.fromJson(jsonD);
    }
    else {
      print("loginApi is call else throw " + response.reasonPhrase.toString());
    }
  }

  ///download api
  static Future<DownloadModel?> downloadeapi()async{
    var request = http.Request('POST', Uri.parse('https://rotarect.herokuapp.com/members/getAllDownload'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonD = jsonDecode(await response.stream.bytesToString());
      return DownloadModel.fromJson(jsonD);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  ///Sign Up api
  static Future<AddNewMemberModel?> signUpApi(
      name, email, mobileno, countryId, stateId, cityid) async {
    var url = baseUrl + 'members/addNewMember';
    print("print Url Data${url}");
    var body = {
      "name": name,
      "email": email,
      "phoneNumber": mobileno,
      "countryId": countryId,
      "stateId": stateId,
      "cityId": cityid
    };
    print("sign Up body print$body");
    try {
      var respopnse = await http.post(Uri.parse(url), body: body);
      if (respopnse.statusCode == 200) {
        print("print sign Data Print${respopnse.body}");

        return AddNewMemberModel.fromJson(jsonDecode(respopnse.body));
      } else {
        throw Exception("The sign Up response code is${respopnse.statusCode}");
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///Sign Up in base Url on Country api
  static Future<AllCountryModel?> allCountryApi() async {
    var url = baseUrl + 'admins/getAllCountry';
    print("print Url Data${url}");
    try {
      var respopnse = await http.post(Uri.parse(url));
      if (respopnse.statusCode == 200) {
        print("all Country Data Response${respopnse.body}");
        return AllCountryModel.fromJson(jsonDecode(respopnse.body));
      } else {
        throw Exception("The response code is${respopnse.statusCode}");
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///Sign Up in base Url on State api
  static Future<AllStateWithCountryId?> allStateApi(countryId) async {
    var url = baseUrl + 'admins/getAllStateWithCountryId';
    var body = {"countryId": countryId};
    try {
      var respopnse = await http.post(Uri.parse(url), body: body);
      if (respopnse.statusCode == 200) {
        print("all state Data Response${respopnse.body}");
        return AllStateWithCountryId.fromJson(jsonDecode(respopnse.body));
      } else {
        throw Exception("The response code is${respopnse.statusCode}");
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///Sign Up in base Url on city api
  static Future<AllCityWithStateIdModel?> allCityApi(StateId) async {
    var url = baseUrl + 'admins/getAllCityWithStateId';
    var body = {"stateId": StateId};
    try {
      var respopnse = await http.post(Uri.parse(url), body: body);
      if (respopnse.statusCode == 200) {
        print("all city Data Response${respopnse.body}");
        return AllCityWithStateIdModel.fromJson(jsonDecode(respopnse.body));
      } else {
        throw Exception("The response code is${respopnse.statusCode}");
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }

  ///getAllDoctor
  static Future<GetAllDoctorModel> allDoctorApiCalling() async {
    print("GetAllDoctor api calling now");
    var url = baseUrl + 'members/getAllDoctor';
    print('allDoctorApiCalling id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("allDoctorApiCalling data response is" + response.body);
    if (response.statusCode == 200) {
      print("allDoctorApiCalling is under the 200 code");
      return GetAllDoctorModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///Directory in old Calling
  // ///getAllMember
  // static Future<GetAllMembersModel> allMemberApiCalling() async {
  //   print("GetAllMember api calling now");
  //   var url = baseUrl + 'members/getAllMember';
  //   print('allMemberApiCalling id api is call url is' + url.toString());
  //   var response = await http.post(
  //     Uri.parse(url),
  //   );
  //   print("allMemberApiCalling data response is" + response.body);
  //   if (response.statusCode == 200) {
  //     print("allDoctorApiCalling is under the 200 code");
  //     return GetAllMembersModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("The response code is${response.statusCode}");
  //   }
  // }

  ///getAllManageMember Api
  static Future<GetAllManageMembersModel> allManageMemberApiCalling() async {
    print("GetAllManageMember api calling now");
    var url = baseUrl + 'admins/getAllManageMember';
    print('allManaggeMemberApiCalling id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("allManageMemberApiCalling data response is" + response.body);
    if (response.statusCode == 200) {
      print("allManageMemberApiCalling is under the 200 code");
      return GetAllManageMembersModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///getAllDonarList Api
  static Future<BloodDonateDonarModel> allBloodDonarApiCalling() async {
    print("AllBloodDonar api calling now");
    var url = baseUrl + 'members/getAllMemberDonationBlood';
    print('AllBlood Donar Data List id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("All Blood Donar data List response is" + response.body);
    if (response.statusCode == 200) {
      print("All Blood Donar the Status Code code${response.statusCode}");
      return BloodDonateDonarModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///Add DonarList Api
  static Future<AddMemberDonationBlood> allAddBloodDonarApiCalling(
      name, phoneNumber, weight, age, groupvalue, dropdownname) async {
    print("All Add BloodDonar api calling now");
    var body = {
      "name": name,
      "phone": phoneNumber,
      "gender": groupvalue,
      "weight": weight,
      "age": age,
      "bloodGroup": dropdownname,
    };
    print("print Blood Donar Req Body$body");
    var url = baseUrl + 'members/addMemberDonationBlood';
    print(
        'All add Blood Donar Data List id api is call url is' + url.toString());
    var response = await http.post(Uri.parse(url), body: body);
    print("All Add Blood Donar data List response is" + response.body);
    if (response.statusCode == 200) {
      print("All Add Blood Donar the Status Code code${response.statusCode}");
      return AddMemberDonationBlood.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///Add AddFor Self Request Api
  static Future<AddNewSelfReqBloodModel?> allAddNewSelfReqBloodApi(
      description, dropdownname) async {
    var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
    print("print Member data$memberId");

    var url = baseUrl + 'members/addNewReqBlood';
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      "bloodGroupId": dropdownname.toString(),
      "description": description,
      "userType": 0,
      "status": 0,
      "memberId": memberId
    });
    print("allAddNewSelfReqBloodApi Body data" +  request.body.toString());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print("allAddNewSelfReqBloodApi on rsponse data code" +  response.statusCode.toString());
    if (response.statusCode == 200) {
      print("allAddNewSelfReqBloodApi under the 200 code " );
      var jsonD = jsonDecode(await response.stream.bytesToString());
      print("allAddNewSelfReqBloodApi under the 200 code aftert the jsonmD" + jsonD.toString() );
      return AddNewSelfReqBloodModel.fromJson(jsonD);
    }
    else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///Add Add For Others Request Api
  static Future<AddNewOtherMemberBlood?>allAddNewOtherReqBloodApi(name,phoneNumber,weight,age,relation,gender) async {
    var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
    print("print Member data$memberId");
    var url = baseUrl +  'members/addNewOtherMemberBlood';
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse(url));
    request.body = json.encode({
      "name": name,
      "memberId": memberId,
      "phone": phoneNumber,
      "gender": gender,
      "weight": weight,
      "age": age,
      "bloodGroup": "6286074fdbe4eed6c1460a2f",
      "relation": relation,
      "reqId": "62860d6d64884ba257d0c614",
      "userType": 1, "status": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      var jsonD = jsonDecode(await response.stream.bytesToString());
      print("add Status Code in Get All Req Blood  in Response${jsonD}");
      return AddNewOtherMemberBlood.fromJson(jsonD);
    } else {
      throw Exception("The response code is${response.statusCode}");

    }
  }


  ///Get All For Self Request Api
  static Future<getNewSelfReqBloodModel> getAllSelfReqBloodApi() async {
      var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
      print("print Member data$memberId");
    var body = {
        "memberId": memberId
      };
    print("Self api calling now");
    var url = baseUrl + 'members/getSelfReqBlood';
    print('Self Request List id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),body: body
    );
    print("Self Request List response is" + response.body);
    if (response.statusCode == 200) {
      print("Self Request the Status Code code${response.statusCode}");
      return getNewSelfReqBloodModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///Get All For Other Request Api
  static Future<getOtherReqBloodModel?> getAllOtherReqBloodApi() async {
    var headers = {'Content-Type': 'application/json'};
    var url = baseUrl + 'members/getAllOtherMemberBlood';
    var request = http.Request('POST', Uri.parse(url));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print("add Status Code in Get All Other Req Blood ${response.statusCode}");
    if (response.statusCode == 200) {

      var jsonD = jsonDecode(await response.stream.bytesToString());
      print("add Status Code in Get All Other Req Blood  in Response${jsonD}");
      return getOtherReqBloodModel.fromJson(jsonD);
    } else {
      print(response.reasonPhrase.toString());
    }
  }

  ///getAllBoard Of Director Api
  static Future<getAllBODModel> allBoardOfDirectorCalling() async {
    print("BoardOfDirector api calling now");
    var url = baseUrl + 'admins/getAllBOD';
    print('BoardOfDirector List id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("BoardOfDirector List response is" + response.body);
    if (response.statusCode == 200) {
      print("BoardOfDirector the Status Code code${response.statusCode}");
      return getAllBODModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("The response code is${response.statusCode}");
    }
  }

  ///getAllBlood Bank  Api
  static Future<GetAllBloodBankModel> getAllBloodBankApi() async {
    print("Get All Blood Banl api calling now");
    var url = baseUrl + 'admins/getAllBloodBank';
    print('Get All Blood Bank List id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("Get All Blood Bank List response is" + response.body);
    if (response.statusCode == 200) {
      print("Get All Blood Bank the Status Code code${response.statusCode}");
      return GetAllBloodBankModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "The get All Blood Bank response code is${response.statusCode}");
    }
  }

  ///add post ask Api
  static Future<AddPostAskModel> addpostaskApi(title,askdate,closedate,discription) async {
    var memberId = await SharedPrefsData.getStringData(SharedPrefsKey.memberId);
    print("print Member data$memberId");
    var url = baseUrl + 'members/addPostAsk';
    print('Add Post Ask Api is call url is' + url.toString());
    var body = {
      "memeberId": memberId,
      "title": title,
      "askDate": askdate,
      "closeDate": closedate,
      "description": discription
    };
    var response = await http.post(
      Uri.parse(url),
      body: body
    );
    print("Add Post Ask Api is response is" + response.body);
    if (response.statusCode == 200) {
      print("Get All Blood Bank the Status Code code${response.statusCode}");
      return AddPostAskModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "The add Post Api response code is${response.statusCode}");
    }
  }


  ///getAllBlood Api
  static Future<getAllPostAsk> getAllPostAskApi() async {
    print("getAllPostAsk api calling now");
    var url = baseUrl + 'members/getAllPostAsk';
    print('getAllPostAsk api calling now id api is call url is' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("getAllPostAsk api calling now response is" + response.body);
    if (response.statusCode == 200) {
      print("Get All Blood Bank the Status Code code${response.statusCode}");
      return getAllPostAsk.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "The get All Blood Bank response code is${response.statusCode}");
    }
  }


  ///FeedBack Api calling
  static Future<FeedBackModel> getfeedBackApi() async {
    print("getfeedBackApi calling now");
    var url = baseUrl + 'members/addNewFeedback';
    print('addNewFeedback api calling now id ' + url.toString());
    var response = await http.post(
      Uri.parse(url),
    );
    print("getfeedBackApi calling now response is" + response.body);
    if (response.statusCode == 200) {
      print("getfeedBackApi the Status Code code${response.statusCode}");
      return FeedBackModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          "getfeedBackApi response code is${response.statusCode}");
    }
  }
}
