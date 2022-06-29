import 'package:flutter/cupertino.dart';
import 'package:rotaract_app/APIs/api.dart';
import 'package:rotaract_app/model/add_contactus_model/add_contact_us_data_model.dart';
import 'package:rotaract_app/model/add_feedback_model/add_feedback_data_model.dart';
import 'package:rotaract_app/model/feedback_model/feedback_model.dart';
import 'package:rotaract_app/model/get_all_doctor_model.dart';
import 'package:rotaract_app/model/homepage_model/get_all_event_calender_model.dart';
import 'package:rotaract_app/model/post_ask_model/add_post_ask_model.dart';
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
import '../model/get_all_member_model.dart';
import '../model/homepage_model/get_all_event_model.dart';
import '../model/homepage_model/get_current_date_event_model.dart';
import '../model/login_model/login_model.dart';
import '../model/member_profile_model/add_job_model.dart';
import '../model/member_profile_model/get_all_job_model.dart';
import '../model/member_profile_model/member_profile_model.dart';
import '../model/member_profile_model/update_member_profile_model.dart';
import '../model/sign_up_model/add_new_member.dart';
import '../model/sign_up_model/all_city_with_stateId_model.dart';
import '../model/sign_up_model/all_country_model.dart';
import '../model/sign_up_model/all_state_with_country_id.dart';

class ProviderNotifier extends ChangeNotifier{

  ///Profile Notifier
  List<MemberData?> memberList = [];
  Future getMemberProfileNotifier() async {
    var res = await Api.memberProfileApi();
    resGetMemberProfileDataNotififeir(res!.data);
    notifyListeners();
   }resGetMemberProfileDataNotififeir(var profileMemberData){
    memberList = profileMemberData;
    notifyListeners();
  }

  ///Update Profile Notifier
  UpdateMemberProfileModel? updatememberProfile;
  Future getUpdateMemberProfileNotifier(bodyData) async {
    var res = await Api.updateMemberProfileApi(bodyData);
    resGetUpdateMemberProfileDataNotififeir(res!);
    notifyListeners();
  }
  resGetUpdateMemberProfileDataNotififeir(var profileupdateMemberData){
    updatememberProfile = profileupdateMemberData;
    notifyListeners();
  }

  ///Profile in Add Job Notifier
  AddJobModel? addJobDataList;
  Future addJobNotifier(jobTitle,noOfPosition,jobDescription,jobType,salary,Remark) async {
    var res = await Api.addJobDataApi(jobTitle,noOfPosition,jobDescription,jobType,salary,Remark);
    resaddJobDataNotififeir(res);
    notifyListeners();
  }
  resaddJobDataNotififeir(AddJobModel? addJobData){
    addJobDataList = addJobData;
    notifyListeners();
  }

  ///Profile in get All Job Notifier
  List<JobAllGetData?> getallJobDataList  =[];
  Future getAllJobNotifier() async {
    var res = await Api.getJobDataApi();
    resgetAllJobDataNotififeir(res!.data);
    notifyListeners();
  }
  resgetAllJobDataNotififeir(var getAllJobData){
    getallJobDataList = getAllJobData;
    notifyListeners();
  }

  ///Login Notifier
  List<LoginData?> logindata=[];
  // LoginModel? loginModel;
  Future getLoginNotifier(mobileno) async {
    print('getLoginNotifier is call');
    var res = await Api.loginApi(mobileno);
    print('getLoginNotifier is call after the resp : ' + res!.data.toString());
    resGetLoginDataNotififeir(res.data);
    notifyListeners();
  }
  resGetLoginDataNotififeir(var loginData){
    logindata = loginData;
    // loginModel = loginModel;.
    notifyListeners();
  }

  ///All SignUp Notifier
  AddNewMemberModel? signUp;
  Future getSignUpNotifier(name,email,mobileno,countryId,stateId,cityid) async {
    var res = await Api.signUpApi(name,email,mobileno,countryId,stateId,cityid);
    resGetSignUpDataNotififeir(res);
    notifyListeners();
  }
  resGetSignUpDataNotififeir(var signupData){
    signUp = signupData;
    notifyListeners();
  }


  ///All Country Notifier
  List<CountryData> countryList = [];
  Future getAllCountryNotifier() async {
    var res = await Api.allCountryApi();
    resGetAllCountryDataNotififeir(res!.data);
    notifyListeners();
  }
  resGetAllCountryDataNotififeir(var country){
    countryList = country;
    notifyListeners();
  }


  ///All State Notifier
  List<StateData> stateList = [];
  Future getAllStateNotifier(countryId) async {
    var res = await Api.allStateApi(countryId);
    resGetAllStateDataNotififeir(res!.data);
    notifyListeners();
  }
  resGetAllStateDataNotififeir(var state){
    stateList = state;
    notifyListeners();
  }

  ///All City Notifier
  List<CityData> cityList = [];
  Future getAllCityNotifier(StateId) async {
    var res = await Api.allCityApi(StateId);
    resGetAllCityDataNotififeir(res!.data);
    notifyListeners();
  }
  resGetAllCityDataNotififeir(var city){
    cityList = city;
    notifyListeners();
  }

  ///Home Page in All Event Show in Calander Notifier
  GetAllEventModel? getAllEventDataNP;
  List<GetAllEventData> getAllEventDataEventList = [];
  Future getAllEventShowinCalanderNotifier() async {
    var res = await Api.getAllEventModelApi();
    print("Calender Event Show$res");
    resGetAllEventShowinCalanderNotififeir(res,res!.data!);
    notifyListeners();
  }
  resGetAllEventShowinCalanderNotififeir(var allEventData,List<GetAllEventData> data1){
    getAllEventDataNP = allEventData;
    getAllEventDataEventList = data1;
    notifyListeners();
  }


  ///Home Page in Current Date  Event Show in date Notifier
  GetCurrentDateEventModel? getAllDateEventNP;
  List<GetCurrentDateEventCurrentDate>? getAllDateEventCurrentDateNP = [];
  Future getAllDateEventShowinNotifier(date) async {
    getAllDateEventCurrentDateNP!.clear();
    var resp = await Api.getAllcurrentEventModelApi(date);
    resGetAllDateEventShowinNotififeir(resp,resp!.data!);
    notifyListeners();
  }
  resGetAllDateEventShowinNotififeir(var allDateEvent,List<GetCurrentDateEventCurrentDate> data){
    getAllDateEventNP = allDateEvent;
    getAllDateEventCurrentDateNP = data;
    notifyListeners();
  }

  ///Home in All Calender Event Show Notifier
  List<CalenderEventData?> getCalenderList = [];
  Future getAllEventCalenderShowNotifier() async {
    var res = await Api.getCalenderEventShow();
    print("print res Event :-)Show${res}");
    resGetCalenderEventShowNotififeir(res!.data);
    notifyListeners();
  }resGetCalenderEventShowNotififeir(var getFeedBackData){
    getCalenderList = getFeedBackData;
    notifyListeners();
  }


  /// this is for the getAllDoctor Notifier
  GetAllDoctorModel? allDoctorListNp;
  Future getAllDoctorListDataNotifier() async{
    print("getAllDoctorListDataNotifier is call");
    var res = await Api.allDoctorApiCalling();
    print("getAllDoctorListDataNotifier after the resp" + res.toString());
    respGetAllDoctorListDataNotifier(res);
  }
  respGetAllDoctorListDataNotifier(GetAllDoctorModel allDoctorData1) async{
    allDoctorListNp = allDoctorData1;
    notifyListeners();
  }

 /// This is for new the addNewMember Notifier old Directory in Calling
 //  GetAllMembersModel? allMemberListNp;
 //  Future getAllMemberListDataNotifier() async{
 //    print("getAllDoctorListDataNotifier is call");
 //    var res = await Api.allMemberApiCalling();
 //    print("getAllDoctorListDataNotifier after the resp" + res.toString());
 //    respGetAllMemberListDataNotifier(res);
 //  }
 //  respGetAllMemberListDataNotifier(GetAllMembersModel allMemberData) async{
 //    allMemberListNp = allMemberData;
 //    notifyListeners();
 //  }


  /// This is for new the addNewMember Notifier
  late GetAllManageMembersModel allManageMemberList;
  List<MemberDataList?> allManageList = [];
  Future getAllManageMemberListDataNotifier() async{
    print("allManageMember ListDataNotifier is call");
    var res = await Api.allManageMemberApiCalling();
    print("allManageMember ListDataNotifier after the resp" + res.toString());
    respGetAllManageMemberListDataNotifier(res,res.data);
  }
  respGetAllManageMemberListDataNotifier(GetAllManageMembersModel allMemberData,var manageMemberListData) async{
    allManageMemberList = allMemberData;
    allManageList = manageMemberListData;
    notifyListeners();
  }

  /// This is for new the BloodDonar List Notifier
  BloodDonateDonarModel? allBloodDonar;
  List<DonarDataList> bloodDonarList =[];
  Future getAllBloodDonarListDataNotifier() async{
    print("all Blood Donar ListDataNotifier is call");
    var res = await Api.allBloodDonarApiCalling();
    print(" Blood Donar ListDataNotifier after the resp" + res.toString());
    respGetAllBloodDonarListDataNotifier(res,res.data!);
  }
  respGetAllBloodDonarListDataNotifier(var allBloodDonarData, ListData) async{
    allBloodDonar = allBloodDonarData;
    bloodDonarList = ListData;
    notifyListeners();
  }

  /// This is for new the Add BloodDonar List Notifier
  AddMemberDonationBlood? addBloodDonar;
  Future addBloodDonarListDataNotifier(name,phoneNumber,weight,age,groupvalue,dropdownname) async{
    print("all add Blood Donar ListDataNotifier is call");
    var res = await Api.allAddBloodDonarApiCalling(name,phoneNumber,weight,age,groupvalue,dropdownname);
    print(" Add Blood Donar ListDataNotifier after the resp" + res.toString());
    respaddAllBloodDonarListDataNotifier(res);
  }
  respaddAllBloodDonarListDataNotifier(var addBloodDonarData) async{
    addBloodDonar = addBloodDonarData;
    notifyListeners();
  }

  /// This is for new the Add Requst For Self Blood List Notifier
  AddNewSelfReqBloodModel? addSelfRequestList;
  Future addSelfRequestBloodListDataNotifier(description,dropdownname) async{
    print("addSelfRequestBloodListDataNotifier is call");
    var res = await Api.allAddNewSelfReqBloodApi(description,dropdownname);
    print("addSelfRequestBloodListDataNotifier after the resp" + res!.data!.bloodGroupId.toString());
    respaddAllSelfRequestBloodListDataNotifier(res);
  }
  respaddAllSelfRequestBloodListDataNotifier(var addSelfReqBloodData) async{
    addSelfRequestList = addSelfReqBloodData;
    notifyListeners();
  }


  /// This is for new the get all  Requst For Self Blood List Notifier
  getNewSelfReqBloodModel? getSelfRequestList;
  Future getAllSelfRequestBloodListDataNotifier() async{
    print("all get aLL sELF Request ListDataNotifier is call");
    var res = await Api.getAllSelfReqBloodApi();
    print("all get aLL sELF Request ListDataNotifier after the resp" + res.toString());
    respgetAllSelfRequestBloodListDataNotifier(res);
  }
  respgetAllSelfRequestBloodListDataNotifier(var getSelfReqBloodData) async{
    getSelfRequestList = getSelfReqBloodData;
    notifyListeners();
  }

  /// This is for new the Add Requst For Self Blood List Notifier
  AddNewOtherMemberBlood? addOtherRequestList;
  Future addOtherRequestBloodListDataNotifier(name,phoneNumber,weight,age,relation,gender) async{
    print("all add Other Request DataNotifier is call");
    var res = await Api.allAddNewOtherReqBloodApi(name,phoneNumber,weight,age,relation,gender);
    print(" Add Others Request Blood ListDataNotifier after the resp" + res.toString());
    respaddAllOtherRequestBloodListDataNotifier(res);
  }
  respaddAllOtherRequestBloodListDataNotifier(var addOtherReqBloodData) async{
    addOtherRequestList = addOtherReqBloodData;
    notifyListeners();
  }

  /// This is for new the get all  Requst For Other Blood List Notifier
  getOtherReqBloodModel? getOtherRequestList;
  Future getAllOtherRequestBloodListDataNotifier() async{
    print("all get aLL Other Request ListDataNotifier is call");
    var res = await Api.getAllOtherReqBloodApi();
    print("all get aLL Other Request ListDataNotifier after the resp" + res.toString());
    respgetAllOtherRequestBloodListDataNotifier(res);
  }
  respgetAllOtherRequestBloodListDataNotifier(var getOtherReqBloodData) async{
    getOtherRequestList = getOtherReqBloodData;
    notifyListeners();
  }


  getAllBODModel? allBodData ;
  Future getAllBodirectorListDataNotifier() async{
    print("all Blood Donar ListDataNotifier is call");
    var res = await Api.allBoardOfDirectorCalling();
    print(" Blood Donar ListDataNotifier after res" + res.toString());
    respGetAllBodirectorListDataNotifier(res);
  }
  respGetAllBodirectorListDataNotifier(var allBodirectorData) async{
    allBodData = allBodirectorData;
    notifyListeners();
  }

 /// get All Blood Bank Data List
  GetAllBloodBankModel? getAllBloodBankListData ;
  Future getAllBloodBankListDataNotifier() async{
    print("all Blood Bank ListDataNotifier is call");
    var res = await Api.getAllBloodBankApi();
    print(" Blood Bank Api ListDataNotifier after res" + res.toString());
    respGetAllBloodBankListDataNotifier(res);
  }
  respGetAllBloodBankListDataNotifier(var allBloodBankData) async{
    getAllBloodBankListData = allBloodBankData;
    notifyListeners();
  }


  ///add Post Ask List Notifier
  AddPostAskModel? AddPostAskListData ;
  Future AddPostAskDataNotifier(title,askdate,closedate,discription) async{
    print("AddPostAsk  List DataNotifier is call");
    var res = await Api.addpostaskApi(title,askdate,closedate,discription);
    print("AddPostAsk  List DataNotifier " + res.toString());
    respAddPostAskListDataNotifier(res);
  }
  respAddPostAskListDataNotifier(var addAllPostAskListData) async{
    AddPostAskListData = addAllPostAskListData;
    notifyListeners();
  }


  ///get Post Ask List Notifier
  List<askData> askDataList = [];
  Future getPostAskDataNotifier() async{
    print("get PostAsk  List Data Notifier is call");
    var res = await Api.getAllPostAskApi();
    print("get PostAsk  List DataNotifier " + res.toString());
    respgetPostAskListDataNotifier(res.data);
  }
  respgetPostAskListDataNotifier(var getAllPostAskListData) async{
    askDataList = getAllPostAskListData;
    notifyListeners();
  }


  ///Download Notifier
  List<Download?> getDownloadList = [];
  Future getAllDownloadNotifier() async {
    var res = await Api.downloadeapi();
    resGetDownloadDataNotififeir(res!.data);
    notifyListeners();
  }resGetDownloadDataNotififeir(var getDownloadData){
    getDownloadList = getDownloadData;
    notifyListeners();
  }

  ///FeedBAck Notifier
  FeedBackModel? getfeedBackList;
  Future getAllFeedBackNotifier() async {
    var res = await Api.getfeedBackApi();
    resGetFeedBackNotififeir(res);
    notifyListeners();
  }resGetFeedBackNotififeir(var getFeedBackData){
    getDownloadList = getFeedBackData;
    notifyListeners();
  }

  /// Add Contact us Data Notifier
  /// Ashish
  AddContactUsDataModel? contactusData;
  List<AddContactUsData> addContactUsDataNp = [];
  Future addContactUsDataNotifier(body) async{
    print("addContactUsDataNotifier is calling");
   var res = await Api().addContactUsApiCalling(body);
   respAddContactUsDataNotifier(res!.data!,res);
  }
  respAddContactUsDataNotifier(AddContactUsData data,var contactdata){
    addContactUsDataNp.add(data);
    contactusData = contactdata;
    print("addContactUsDataNotifier ${data}");
    notifyListeners();
  }

  /// Add New FeedBack Data Notifier
  /// Ashish
  AddNewFeedBackDataModel? addNewFeedbackData;
  List<AddNewFeedBackData> addNewFeedBackDataNp = [];
  Future addNewFeedBackDataNotifier(body) async{
    print("addNewFeedBackDataNotifier is calling");
    var res = await Api().addNewFeedBackApiCalling(body);
    resAddNewFeedBackDataNotifier(res!.data!, res);
  }
  resAddNewFeedBackDataNotifier(AddNewFeedBackData data, var addNewFeedBackdata){
    addNewFeedBackDataNp.add(data);
    addNewFeedbackData = addNewFeedBackdata;
    print("addNewFeedBackDataNotifier ${data}");
    notifyListeners();
  }
}