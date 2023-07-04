import 'dart:convert';

import 'package:device_imei/device_imei.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Models/Materials%20Models/textMaterialModel.dart';
import 'package:geoprep/Models/Materials%20Models/videoMaterialModel.dart';
import 'package:geoprep/Screens/Material%20Screen/materialScreen.dart';
import 'package:geoprep/Screens/Material%20Screen/video_player_exmaple.dart';
import 'package:geoprep/Screens/chapterListSelectionScreen.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Courses Models/courseChapterListModel.dart';
import '../../Models/Courses Models/courseDetailsSelectionModel.dart';
import '../../Models/Courses Models/courseListModel.dart';
import '../../Models/Courses Models/courseTopicListModel.dart';
import '../../Screens/courseDetailsScreen.dart';
import '../../Screens/courseListSelectionScreen.dart';
import '../../Screens/courseTopicListSelectionScreen.dart';
import '../../services/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:device_imei/device_imei.dart';

class DashBoardController extends GetxController{

var isLoading=false.obs;

  void onInit() {
    print("my topics key: ${PreferenceUtils.getString("topicKey")}");
     getCourseList(PreferenceUtils.getString("subCatKey"));
   print("subcat: ${PreferenceUtils.getString("subCatKey")}");

  }

var isVideo=true.obs;
var coursesListSelection = <CourseListModel>[].obs;

Future<void> getCourseList(String subCatId) async {
  // final SharedPreferences prefs = await _prefs;
  // final accessToken=prefs.getString("accessToken");
  isLoading.value=true;
  coursesListSelection.clear();
  var headers = {
    'Content-Type': 'application/json',
    'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
  };
  try {
    var url = Uri.parse(
        "${ApiEndpoints.baseUrl}${ApiEndpoints.coursesEndPoints.courses}$subCatId");
    // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
    print("call Url -> :: $url");
    // print("token -> ::$accessToken");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      isLoading.value=false;
      final json = jsonDecode(response.body);
      if (json['data'] is Iterable) {
        for (var i in json['data']) {
          coursesListSelection.add(CourseListModel.fromJson(i));
        }
      }
      var encoder = const JsonEncoder.withIndent("     ");
      print("my courseList: ${encoder.convert(json)}");

      // print("my cate: ${CourseListModel}");
      // Get.to(CourseDetailsScreen());
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

var courseDetailsList = <CourseDetailsSelectionModel>[].obs;
var courseDetail;
var courseeeKey;
var langsKeys;
Future<void> getCourseDetails(String courseKey) async {
  // final SharedPreferences prefs = await _prefs;
  // final accessToken=prefs.getString("accessToken");
  courseDetailsList.clear();
  var headers = {
    'Content-Type': 'application/json',
    'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
  };
  try {
    var url = Uri.parse(
        "${ApiEndpoints.baseUrl}${ApiEndpoints.coursesEndPoints.coursesDetails}$courseKey");
    // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
    print("call Url -> :: $url");
    // print("token -> ::$accessToken");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      var encoder = const JsonEncoder.withIndent("     ");
      print("my courseDetails: ${encoder.convert(json)}");
      courseDetail = json["data"]["categoryDecription"];
      courseeeKey = json["data"]["courseKey"];
      langsKeys = json["data"]["languagesArray"][0]["languageKey"];
      // languageKeySelected=json["data"]["languagesArray"][0]["languageKey"];
      PreferenceUtils.setString("coursesKey", json["data"]["courseKey"]);
      PreferenceUtils.setString(
          "languagesKey", json["data"]["languagesArray"][0]["languageKey"]);

      // PreferenceUtils.setString("languageKey",json["data"]["languageKey"] );

      print(
          "my course descp: $courseDetail, ${PreferenceUtils.getString("coursesKey", json["data"]["courseKey"])},${PreferenceUtils.getString("languagesKey", json["data"]["languagesArray"][0]["languageKey"])}");
      Get.to(CourseDetailsScreen());
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

var courseTopicsList = <CourseTopicListModel>[].obs;
var courseKeys = PreferenceUtils.getString("coursesKey");
var langKeys = PreferenceUtils.getString("languageKeys");

Future<void> getCourseTopicList() async {
  // final SharedPreferences prefs = await _prefs;
  // final accessToken=prefs.getString("accessToken");
  courseTopicsList.clear();
  var headers = {
    'Content-Type': 'application/json',
    'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
  };
  try {
    var url = Uri.parse(
        "${ApiEndpoints.baseUrl}master-course-topics.php?courseKey=$courseeeKey&languageKey=$langsKeys");
    // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
    print("call Url -> :: $url");
    // print("token -> ::$accessToken");
    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      var encoder = const JsonEncoder.withIndent("     ");
      print("my courseTopicList: ${encoder.convert(json)}");
      if (json['data'] is Iterable) {
        for (var i in json['data']) {
          courseTopicsList.add(CourseTopicListModel.fromJson(i));
        }
      }
      Get.to(CourseTopicListSelectionScreen());
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
  var courseChapterList=<CourseChapterListModel>[].obs;
  var topicKeys;
  Future<void> getChapterList() async{
    // final SharedPreferences prefs=await _prefs;
    // final accessToken=prefs.getString("accessToken");
    isLoading.value=true;
    courseChapterList.clear();
    var headers={'Content-Type':'application/json',
      'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
    };
    try{
      var courseKey=PreferenceUtils.getString("coursesKey");
      print("our course: $courseKey");
      var url=Uri.parse("https://geoprep.co.in/api/master-course-chapters.php?courseKey=$courseeeKey&topicKey=$topicKeys&languageKey=$langsKeys");
      // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
      print("call Url -> :: $url");
      // print("token -> ::$accessToken");
      http.Response response=await http.get(url,headers: headers);
      if(response.statusCode==200){
        isLoading.value=false;

        final json=jsonDecode(response.body);

        var encoder = const JsonEncoder.withIndent("     ");
        print("my chapterList: ${encoder.convert(json)}");
        if(json['data'] is Iterable){
          for(var i in json['data']){
            courseChapterList.add(CourseChapterListModel.fromJson(i));
          }
        }
        Get.to(ChapterListSelectionScreen());
        print("my chap: ${courseChapterList[0].chapterDecription}");


      }

      else{
        throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
      }
    }
    catch(error){
      isLoading.value=false;
      // refreshToken();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text("Error"),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text(error.toString())
          ],
        );
      });
    }
  }

Future<void> getChapterListSubMaterial() async{
  // final SharedPreferences prefs=await _prefs;
  // final accessToken=prefs.getString("accessToken");
  isLoading.value=true;
  courseChapterList.clear();
  var headers={'Content-Type':'application/json',
    'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
  };
  try{
    var courseKey=PreferenceUtils.getString("coursesKey");
    var topicKey=PreferenceUtils.getString("topicKey");
    var languageKey=PreferenceUtils.getString("languageKeys");
    print("our course: $courseKey");
    var url=Uri.parse("https://geoprep.co.in/api/master-course-chapters.php?courseKey=$courseKey&topicKey=$topicKey&languageKey=$languageKey");
    // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
    print("call Url -> :: $url");
    // print("token -> ::$accessToken");
    http.Response response=await http.get(url,headers: headers);
    if(response.statusCode==200){
      isLoading.value=false;

      final json=jsonDecode(response.body);

      var encoder = const JsonEncoder.withIndent("     ");
      print("my chapterList: ${encoder.convert(json)}");
      if(json['data'] is Iterable){
        for(var i in json['data']){
          courseChapterList.add(CourseChapterListModel.fromJson(i));
        }
      }
      print("my chap: ${courseChapterList[0].chapterDecription}");


    }

    else{
      throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
    }
  }
  catch(error){
    isLoading.value=false;
    // refreshToken();
    showDialog(context: Get.context!, builder: (context){
      return SimpleDialog(
        title: Text("Error"),
        contentPadding: EdgeInsets.all(20),
        children: [
          Text(error.toString())
        ],
      );
    });
  }
}

  var textMaterialsList=<TextMaterialsModel>[].obs;


  Future<void> getTextMaterials(String chapterKey) async{
    isVideo.value=false;
    textMaterialsList.clear();

    // final SharedPreferences prefs=await _prefs;
    var courseKey=PreferenceUtils.getString("coursesKey");
    final accessToken=PreferenceUtils.getString("token");
    var headers={'Content-Type':'application/json',
      'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
      "Authorization":"Bearer $accessToken",
    };
    try{
      var url=Uri.parse("${ApiEndpoints.baseUrl}${ApiEndpoints.materialsEndPoints.textMaterials}courseKey=$courseKey&languageKey=$langsKeys&chapterKey=$chapterKey");
      // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
      print("call Url -> :: $url");
      // print("token -> ::$accessToken");
      http.Response response=await http.get(url,headers: headers);
      if(response.statusCode==200){
        final json=jsonDecode(response.body);

        var encoder = const JsonEncoder.withIndent("     ");
        print("my textMaterials: ${encoder.convert(json)}");
        if(json['data'] is Iterable){
          for(var i in json['data']){
            textMaterialsList.add(TextMaterialsModel.fromJson(i));
          }
        }
        print("my material: ${textMaterialsList[0].textMaterialDecription}");
        Get.to(MaterialScreen());


      }

      else{
        throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
      }
    }
    catch(error){
      // refreshToken();
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text("Error"),
          contentPadding: EdgeInsets.all(20),
          children: [
            Text(error.toString())
          ],
        );
      });
    }
  }

var videoMaterialsList=<VideoMaterialsModel>[].obs;


Future<void> getVideoMaterials(String chapterkey) async{
  isVideo.value=true;
  // final SharedPreferences prefs=await _prefs;
  var courseKey=PreferenceUtils.getString("coursesKey");
  final accessToken=PreferenceUtils.getString("token");
  var headers={'Content-Type':'application/json',
    'Cookie': 'PHPSESSID=v6otv9p0ha4211desqftj1ekch',
    "Authorization":"Bearer $accessToken",
  };
  try{
    var url=Uri.parse("${ApiEndpoints.baseUrl}${ApiEndpoints.materialsEndPoints.videoMaterials}courseKey=$courseKey&languageKey=$langsKeys&chapterKey=$chapterkey");
    // var url=Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.categoriesEndPoints.categories);
    print("call Url -> :: $url");
    // print("token -> ::$accessToken");
    http.Response response=await http.get(url,headers: headers);
    if(response.statusCode==200){
      final json=jsonDecode(response.body);

      var encoder = const JsonEncoder.withIndent("     ");
      print("my textMaterials: ${encoder.convert(json)}");
      if(json['data'] is Iterable){
        for(var i in json['data']){
          videoMaterialsList.add(VideoMaterialsModel.fromJson(i));
        }
      }
      Get.to(VideoPlayerExample(),arguments: "${videoMaterialsList[0].videoMaterialFileUrl}");
      print("my material: ${videoMaterialsList[0].videoMaterialDecription}");


    }

    else{
      throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
    }
  }
  catch(error){
    // refreshToken();
    showDialog(context: Get.context!, builder: (context){
      return SimpleDialog(
        title: Text("Error"),
        contentPadding: EdgeInsets.all(20),
        children: [
          Text(error.toString())
        ],
      );
    });
  }
}


}