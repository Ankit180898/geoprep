import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Models/Category%20Models/category_model.dart';
import 'package:geoprep/Models/Category%20Models/subCategory_model.dart';
import 'package:geoprep/Models/Courses%20Models/courseChapterListModel.dart';
import 'package:geoprep/Models/Courses%20Models/courseListModel.dart';
import 'package:geoprep/Models/Courses%20Models/courseTopicListModel.dart';
import 'package:geoprep/Screens/auth%20screen/login_screen.dart';
import 'package:geoprep/Screens/auth%20screen/signup_screen.dart';
import 'package:geoprep/Screens/courseDetailsScreen.dart';
import 'package:geoprep/Screens/courseListSelectionScreen.dart';
import 'package:geoprep/Screens/courseTopicListSelectionScreen.dart';
import 'package:geoprep/Screens/dashboard_screen.dart';
import 'package:geoprep/Screens/subCatSelectionScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Models/Courses Models/courseDetailsSelectionModel.dart';
import '../../Screens/bottom_nav_widget.dart';
import '../../services/api_endpoints.dart';

class RegistrationController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  var isLoading = false.obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    getAllCategories();
    // getCourseTopicList();
    // getSubCategory();
  }
  var chooseLanguagePopSelected="1";
  var categorySelected;
  var subCategorySelected;
  var languageKeySelected;

  Future<void> registerWithEmail() async {
    isLoading.value = true;
    try {
      var headers = {'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch'};
      // This will be sent as form data in the post requst
      var map = <String, dynamic>{};
      map['userName'] = usernameController.text;
      map['userPhone'] = phoneNoController.text;
      map['userEmail'] = emailController.text;
      map['userPassword'] = passwordController.text;
      map['userCategoryKey'] = '$categorySelected';
      map['userSubCategoryKey'] = '$subCategorySelected';
      map['userLanguageKey'] = '$chooseLanguagePopSelected';

      http.Response response = await http.post(
          Uri.parse(
              ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.registerEmail),
          body: map,
          headers: headers);
      if (response.statusCode == 200) {
        isLoading.value = false;
        final json = jsonDecode(response.body);
        print(response.body);
        var encoder = const JsonEncoder.withIndent("     ");
        print("my info: ${encoder.convert(json)}");
        Get.offAll(LogInScreen());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(30),
              children: [Text(e.toString())],
            );
          });
    }
  }

  var pin1 = TextEditingController();

  // Future<void> verifyOtp() async{
  //   isLoading.value=true;
  //   try{
  //     var headers= {
  //       'Content-Type': 'application/json'
  //     };
  //     var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.tvLogin.otpVerify);
  //     Map sendData={
  //       "otpToken": pin1.text
  //     };
  //     http.Response response=await http.post(url,body: jsonEncode(sendData),headers: headers);
  //
  //     if(response.statusCode==200){
  //
  //       final json=jsonDecode(response.body);
  //       SharedPreferences preferences=await _prefs;
  //       var tvAccessToken = json['eUser']['tvAccessToken'];
  //
  //       preferences.setString("tvAccessToken", tvAccessToken);
  //       print(json);
  //       pin1.clear();
  //       isLoading.value=false;
  //       // Get.offAll(BottomNav());
  //     }else{
  //       throw jsonDecode(response.body)["message"]??"Unknown Error";
  //     }
  //   }catch(e){
  //
  //     showDialog(context: Get.context!, builder: (context){
  //       pin1.clear();
  //       return SimpleDialog(
  //         title: Text("Error"),
  //         contentPadding: EdgeInsets.all(30),
  //         children: [
  //           Text(e.toString())
  //         ],
  //       );
  //     });
  //   }
  // }
  var categoryList = <CategoryModel>[].obs;

  var courseListSelected;
  Future<void> getAllCategories() async {
    final SharedPreferences prefs = await _prefs;
    // final accessToken=prefs.getString("accessToken");
    categoryList.clear();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
    };
    try {
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
      // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
      print("call Url -> :: $url");
      // print("token -> ::$accessToken");
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['data'] is Iterable) {
          for (var i in json['data']) {
            categoryList.add(CategoryModel.fromJson(i));
          }
        }
        var encoder = const JsonEncoder.withIndent("     ");
        print("my category: ${encoder.convert(json)}");
        print("my cate: ${categoryList[1].categoryName}");
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      // refreshToken();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }

  var subCategoryList = <SubCategoryModel>[].obs;

  Future<void> getSubCategory(String catId) async {
    final SharedPreferences prefs = await _prefs;
    print("cat id: $catId");
    // final accessToken=prefs.getString("accessToken");
    subCategoryList.clear();
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
    };
    try {
      var url = Uri.parse(
          "${ApiEndpoints.baseUrl}${ApiEndpoints.categoriesEndPoints.subCategories}$catId");
      // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
      print("call Url -> :: $url");
      // print("token -> ::$accessToken");
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['data'] is Iterable) {
          for (var i in json['data']) {
            subCategoryList.add(SubCategoryModel.fromJson(i));
          }
        }
        var encoder = const JsonEncoder.withIndent("     ");
        print("my subCat: ${encoder.convert(json)}");
        print("my subCate: ${subCategoryList[1].categoryName}");
        Get.to(SubCategorySelectionScreen());
      } else {
        throw jsonDecode(response.body)["message"] ?? "Unknown Error Occurred";
      }
    } catch (error) {
      // refreshToken();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }


}
