import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:logger/logger.dart';
import '../Constant/PreferenceUtils.dart';
import '../Constant/app_constants.dart';
import '../Constant/const.dart';
import '../Models/Api_models/common_http_exception.dart';
import '../Models/Api_models/common_response_model.dart';
import '../all_colors.dart';
import '../text_style.dart';

bool appInDevlopment = false;
String ccForGlobal = "us";
enum ServiceEnv {
  prod,
  staging,
  dev,
}

class APIConfig {
  APIConfig._();

  static ServiceEnv env = ServiceEnv.dev;
  static String baceUrl = "";
}

Future<CommonResponse> getForIp() async {
  String url = "http://ip-api.com/json";
  print("call Url -> :: " + url);
  try {
    Response response = await Dio().get(url);
    print("response of $url -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data is Map && (response.data as Map).containsKey("countryCode")) ccForGlobal = response.data["countryCode"];
      return CommonResponse.fromJson(response.data);
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    return CommonResponse(status: 0, message: error.response?.data['message']);
  } catch (e) {
    Logger().e(e.toString());
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

/*Future<CommonResponse> getWalletList() async {
  String url =
      "https://explorer.walletconnect.com/_next/data/rBOMJOAm1Nrct0fjtOOlA/index.json?type=wallet";
  print("call Url -> :: " + url);
  try {
    Response response = await Dio().get(url);
    print("response of $url -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 &&
        (response.statusCode ?? 0) <= 299) {
      return CommonResponse.fromJson(response.data);
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    return CommonResponse(status: 0, message: error.response?.data['message']);
  } catch (e) {
    Logger().e(e.toString());
    return CommonResponse(
        status: 0, message: "Something went wrong. Please try again.");
  }
}*/

Future<CommonResponse> get(String endpoint) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  print("call Url -> :: " + url);
  try {
    Response response = await Dio().get(url);
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    return CommonResponse(status: 0, message: error.response?.data['message']);
  } catch (e) {
    Logger().e(e.toString());
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> post(String endpoint, dynamic sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  print("call Url -> :: " + url);

  print("Send Dataa -> :: ");
  log(sendData.toString());
  print("Send Data ->|<- ");
  try {
    Response response = await Dio().post(url, data: sendData);
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        if (endpoint.endsWith("/v1/verify-otp") && response.data['status'] == 403) {
          return CommonResponse.fromJson(response.data);
        } else {
          throw CommonHttpException(response.data['message']);
        }
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      Logger().e(response.data.toString());
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    return CommonResponse(status: 0, message: error.response?.data['message'], data: error.response?.data['data']);
  } catch (e) {
    Logger().e(e.toString());
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> postWithFD(String endpoint, FormData sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  print("call Url -> :: " + url);

  print("Send Dataa -> :: ");
  log(sendData.toString());
  print("Send Data ->|<- ");
  try {
    Response response = await Dio().post(url, data: sendData);
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    return CommonResponse(status: 0, message: error.response?.data['message']);
  } catch (e) {
    print(e.toString());
    Logger().e(e.toString());
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}


Future<CommonResponse> getWithToken(String endpoint) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  try {
    Response response = await Dio().get(
      url,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      print(response.data['message']);
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response?.data);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");
      var refRes = await refreshToken(endpoint, null, 1);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> postWithToken(String endpoint, dynamic sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";

  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  log(sendData.toString());
  print("sendData end ->|<- ");
  try {
    Response response = await Dio().post(
      url,
      data: sendData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");

    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");

      var refRes = await refreshToken(endpoint, null, 2);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> postWithTokenforcountry(String endpoint) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";

  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  print("sendData end ->|<- ");
  try {
    Response response = await Dio().post(
      url,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");

    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");

      var refRes = await refreshToken(endpoint, null, 2);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> postWithTokenFD(String endpoint, FormData sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";

  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  log(sendData.toString());
  print("sendData end ->|<- ");
  try {
    Response response = await Dio().post(
      url,
      data: sendData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "multipart/form-data",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");

    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");

      var refRes = await refreshToken(endpoint, null, 2);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> putWithToken(String endpoint, dynamic sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";

  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);
  // String imageFirst = PreferenceUtils.getString(AppConstants.IMAGE_PATH);
  // String imageLast = PreferenceUtils.getString(AppConstants.IMAGE_PATH_LAST);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  log(sendData.toString());
  print("sendData end ->|<- ");
  try {
    Response response = await Dio().put(
      url,
      data: sendData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");

    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // return CommonResponse(status: -1, message: e.response?.data['message']);
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");
      // return refreshToken(endpoint!, sendData, 3);
      var refRes = await refreshToken(endpoint, null, 3);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> putwithtokenForFav(String endpoint) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";

  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);
  // String imageFirst = PreferenceUtils.getString(AppConstants.IMAGE_PATH);
  // String imageLast = PreferenceUtils.getString(AppConstants.IMAGE_PATH_LAST);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  //log(sendData.toString());
  print("sendData end ->|<- ");
  try {
    Response response = await Dio().put(
      url,
      //data: sendData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");

    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // return CommonResponse(status: -1, message: e.response?.data['message']);
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");
      // return refreshToken(endpoint!, sendData, 3);
      var refRes = await refreshToken(endpoint, null, 3);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse> deleteWithToken(String endpoint) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  try {
    Response response = await Dio().delete(
      url,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      print(response.data['message']);
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response?.data);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");

      var refRes = await refreshToken(endpoint, null, 4);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}
Future<CommonResponse> deleteWithTokenWithData(String endpoint,dynamic sendData) async {
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$endpoint";
  String acToken = PreferenceUtils.getString(AppConstants.ACCESS_TOKEN);

  print("call Url -> :: " + url);
  print("token -> :: " + acToken);
  print("sendData -> :: ");
  log(sendData.toString());
  try {
    Response response = await Dio().delete(
      url,
      data: sendData,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": acToken,
        },
      ),
    );
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      print(response.data['message']);
      if (response.data['status'] != 200 && response.data['status'] != 201) {
        throw CommonHttpException(response.data['message']);
      } else {
        return CommonResponse.fromJson(response.data);
      }
    } else {
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (e) {
    print(e.response?.data);
    Logger().e(e.toString());
    if (e.response?.statusCode == 401) {
      // g.Get.offAllNamed("/signIn");
      // showToast(e.response?.data['message'] ?? "");

      var refRes = await refreshToken(endpoint, null, 4);
      if (refRes != null) {
        return refRes;
      } else {
        return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
      }
      // return CommonResponse(status: -1, message: e.response?.data['message']);
    } else {
      return CommonResponse(status: 0, message: e.response?.data['message']);
    }
  } catch (e) {
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

Future<CommonResponse?> refreshToken(String endpoint, dynamic oldSendData, int type) async {
  var reToken = PreferenceUtils.getString(AppConstants.REFRESH_TOKEN);
  if (reToken == "") {
    return null;
  }
  var sendData = {"refresh_token": reToken};
  final url = "${appInDevlopment ? ApiConst.base_url_dev : ApiConst.base_url_prod}$ApiConst.refreshToken";
  try {
    Response response = await Dio().post(url, data: sendData);
    print("response of $endpoint -> :: ");
    log(json.encode(response.data));
    print("response end ->|<- ");
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) <= 299) {
      await PreferenceUtils.setString(AppConstants.ACCESS_TOKEN, response.data["access_token"] ?? "");
      if (type == 1) {
        return await getWithToken(endpoint);
      } else if (type == 2) {
        return await postWithToken(endpoint, oldSendData);
      } else if (type == 3) {
        return await putWithToken(endpoint, oldSendData);
      } else {
        return await deleteWithToken(endpoint);
      }
    } else {
      Logger().e(response.data.toString());
      throw Exception(response.data);
    }
  } on CommonHttpException catch (error) {
    Logger().e(error.toString());
    return CommonResponse(status: 0, message: error.message);
  } on DioError catch (error) {
    Logger().e(error.response?.data.toString());
    var message = "Login session is expired login again.";
    //g.Get.offAll(() => FirstSignIn());
    return CommonResponse(status: 0, message: message, data: error.response?.data['data']);
  } catch (e) {
    Logger().e(e.toString());
    return CommonResponse(status: 0, message: "Something went wrong. Please try again.");
  }
}

/*readNotification(String id) async {
  var sendData = id != ""
      ? {
          "notification_id": id,
        }
      : {};
  var response = await putWithToken(ApiConst.updateReadNotification, sendData);

  if (response.status == 0) {
    showToast(response.message.toString());
  } else {
    if (id != "") {
     // notificationCount.value = notificationCount.value - 1;
    } else {
      // readList.clear();

     // notificationCount.value = 0;
    }
  }
}*/

// final channel = WebSocketChannel.connect(
//   Uri.parse('wss://3liswk8f3i.execute-api.us-east-1.amazonaws.com/staging?token=${PreferenceUtils.getString(AppConstants.ACCESS_TOKEN)}'),
// );
// startNotification() {
//   channel.stream.listen(addListenerForNotification);
// }

void addListenerForNotification(data) {
  if (data != null) {
    Map<String, dynamic> responseJson = json.decode(data.toString());
    if (responseJson['message_type'] == 'push_notification_count') {
      if (responseJson['data']['unread_notification_count'] > 0) {
       // notificationCount.value = responseJson['data']['unread_notification_count'];
      } else {
       // notificationCount.value = 0;
      }
    }
  }
}

showToast(dynamic? msg, {bool isForError = true}) {
  if (msg != null) {
    g.Get.closeCurrentSnackbar();
    if (msg is Iterable) {
      g.Get.showSnackbar(g.GetSnackBar(
        // titleText: Text(msg, style: TextStyles.ts16W400H24.copyWith(color: Colors.white)),
        messageText: Text(msg.join(",\n"), style: TextStyles.ts16W500H26.copyWith(color: Colors.white, fontSize: 20)),
        snackPosition: g.SnackPosition.TOP,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(10),
        borderRadius: 0,
        backgroundColor: isForError ? Style.alert_scarlet_red : Style.pDXBeam_azure_green,
      ));
      // Fluttertoast.showToast(
      //     msg: msg.join(",\n"), toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.black38, textColor: Colors.white, fontSize: 16.0);
    } else {
      g.Get.showSnackbar(g.GetSnackBar(
        // titleText: Text(msg, style: TextStyles.ts16W400H24.copyWith(color: Colors.white)),
        messageText: Text(msg, style: TextStyles.ts16W500H26.copyWith(color: Colors.white, fontSize: 20)),
        snackPosition: g.SnackPosition.TOP,
        duration: Duration(seconds: 3),
        margin: EdgeInsets.all(10),
        borderRadius: 0,
        backgroundColor: isForError ? Style.alert_scarlet_red : Style.pDXBeam_azure_green,
      ));
      // Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, timeInSecForIosWeb: 1, backgroundColor: Colors.black38, textColor: Colors.white, fontSize: 16.0);
    }
  }
}
