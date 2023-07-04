import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Screens/bottom_nav_widget.dart';
import '../../Screens/dashboard_screen.dart';
import '../../services/api_endpoints.dart';

class LoginController extends GetxController{
  var emailController=TextEditingController();
  var passController=TextEditingController();
  var isLoading=false.obs;
  final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();


  Future<void> loginWithEmail() async{
    final SharedPreferences prefs = await _prefs;

    isLoading.value=true;
    try{
      // This will be sent as form data in the post requst
      var map = <String, dynamic>{};
      map['userEmail'] = emailController.text.trim();
      map['userPassword'] = passController.text;

      http.Response response = await http.post(Uri.parse(ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.loginEmail),body: map);
      if(response.statusCode==200){
        isLoading.value=false;
        print(response.body);
        final json=jsonDecode(response.body);
        print(jsonDecode(response.body)["token"]);
        prefs.setString("token",jsonDecode(response.body)["token"].toString());
        prefs.setString("languageKeys",jsonDecode(response.body)['data']["userLanguageKey"] );
        prefs.setString("catKey",jsonDecode(response.body)['data']["userCategoryKey"] );
        prefs.setString("subCatKey",jsonDecode(response.body)['data']["userSubCategoryKey"] );
        // print("subCatId: ${PreferenceUtils.getString("token")}");

        var encoder = const JsonEncoder.withIndent("     ");
        print("my info: ${encoder.convert(json)}");
        Get.offAll(BottomNav());
      }
      else{
        throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
      }

    }catch(e){
      isLoading.value=false;
      log(e.toString());
      showDialog(context: Get.context!, builder: (context){
        return SimpleDialog(
          title: Text("Error"),
          contentPadding: EdgeInsets.all(30),
          children: [
            Text(e.toString())
          ],
        );
      });
    }
  }


// @override
  // onInit(){
  //   AppUtils.startCheckingForInternet();
  //   super.onInit();
  // }
  //
  // @override
  // void dispose(){
  //   super.dispose();
  // }
  //

//   Rx<UserModel?> userModelList=Rx(null);
//
//   Future<void> loginWithEmail() async{
//     isLoading.value=true;
//     var headers={'Content-Type':'application/json',};
//     try{
//       var url=Uri.parse(
//         ApiEndpoints.baseUrl + ApiEndpoints.authEndpoints.loginEmail
//       );
//       var body={
//         'email':emailController.text.trim(),
//         'password':passController.text
//       };
//       http.Response response=await http.post(url,body: jsonEncode(body),headers: headers);
//       userModelList.value=null;
//       if(response.statusCode==200) {
//         isLoading.value = false;
//         final json = jsonDecode(response.body);
//         print("json: ${json["data"]["email"]}");
//         userModelList.value = UserModel.fromJson(json);
//         var accessToken = json['data']['accessToken'];
//         var refreshToken = json['data']['refreshToken'];
//         // var tvAccessToken=json['eUser']['tvAccessToken'];
//         // var tvRefreshToken=json['eUser']['tvAccessToken'];
//         var email = json['data']['email'];
//         var name = json['data']['name'];
//         var userId=json['data']['_id'];
//         var following=userModelList.value?.data?.following?.length;
//         var isAdmin=userModelList.value?.data?.isAdmin;
//         var sheqPoints=userModelList.value?.data?.totalSheqPoints;
//         final SharedPreferences prefs = await _prefs;
//         // PreferenceUtils.setString('name', name);
//         // PreferenceUtils.setString('email', email);
//         // PreferenceUtils.setString('accessToken1', accessToken);
//         await prefs.setString('accessToken', accessToken);
//         await prefs.setString('refreshToken', refreshToken);
//         await prefs.setString('email', email);
//         await prefs.setString('name', name);
//         await prefs.setString('userId',userId);
//         await prefs.setInt('following',following!);
//         await prefs.setBool('isAdmin',isAdmin!);
//         await prefs.setInt('sheqPoints',sheqPoints!);
//
//         // await prefs.setString('tvAccessToken', tvAccessToken);
//         print("my name: ${prefs.getString('name')}");
//         // print("following: ${prefs.getString('following')}");
//         print(response.body);
//         print(email);
//         Get.offAll(BottomNav());
//       }
//       else{
//           throw jsonDecode(response.body)["message"]??"Unknown Error Occurred";
//         }
//       }
//     catch(error){
//       log(error.toString());
//       print(error.toString());
//       Get.back();
//       showDialog(context: Get.context!, builder: (context){
//         return SimpleDialog(
//           title: Text("Error"),
//           contentPadding: EdgeInsets.all(20),
//           children: [
//             Text(error.toString())
//           ],
//         );
//       });
//     }
// }
  // Future<void> refreshToken() async {
  //   final SharedPreferences prefs=await _prefs;
  //   final refreshToken = prefs.getString("refreshToken");
  //   var headers={'Content-Type':'application/json',
  //     "Authorization":"Bearer $refreshToken"
  //   };
  //   try{
  //     var url=Uri.parse(
  //         '${ApiEndpoints.baseUrl}/v1/sheqonomi/user/refresh'
  //     );
  //     http.Response response=await http.get(url,headers: headers);
  //     if(response.statusCode==200){
  //       final json=jsonDecode(response.body);
  //       await prefs.setString('accessToken', refreshToken!);
  //
  //     }
  //
  //
  //   }catch(e){
  //     showDialog(context: Get.context!, builder: (context){
  //       return SimpleDialog(
  //         title: Text("Error"),
  //         contentPadding: EdgeInsets.all(20),
  //         children: [
  //           Text(e.toString())
  //         ],
  //       );
  //     });
  //   }
  //   }

}