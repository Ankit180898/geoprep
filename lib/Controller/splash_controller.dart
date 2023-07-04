import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Screens/bottom_nav_widget.dart';
import 'package:geoprep/Screens/dashboard_screen.dart';
import 'package:geoprep/Screens/auth%20screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geoprep/Api_repository/ApiRepo.dart' as ApiRepo;
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/app_utils.dart';
import '../animations/page_route.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    //getAllCountry();
    // ApiRepo.getForIp();
    super.onInit();
    onTimeLoad();

  }

  onTimeLoad() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 3), () async {
      // await PreferenceUtils.init();
     // AppUtils.startCheckingForInternet();

      prefs.getString("token")==null?Get.offAll(LogInScreen()):Get.offAll(BottomNav());

    });
  }

  /*getUserData() async {
    var response = await ApiRepo.getWithToken(ApiConst.getProfile);
    if (response.status == 0) {
      // ApiRepo.showToast(response.message.toString());
      Get.offNamed("/signIn");
    } else {
      // print(response.data);
      var profileData = ProfileUserModel.fromJson(response.data);
      PreferenceUtils.setBool(AppConstants.IS_BIO_ON, (profileData.userMeta?.sEnableBiometric ?? "0") == "0" ? false : true);
      try {
        PreferenceUtils.setString(AppConstants.PROFILE_LANG, response.data["language"] ?? "English");
        var lanCode = AppConstants.languageLst
            .singleWhere(
              (element) => element.name == (response.data["language"] ?? "English"),
          orElse: () => CountriesModel(name: "English", code: "en-IN"),
        )
            .code!;
        translateTo.value = Locale(lanCode);
        Get.offNamed("/signIn");
      } catch (e) {
        Get.offNamed("/signIn");
      }
    }
    // initUniLinks();
  }

  getMeData() async {
    var response = await ApiRepo.getWithToken(ApiConst.me);
    if (response.status == 0) {
      // ApiRepo.showToast(response.message.toString());
      // Get.offNamed("/signIn");
    } else {
      // print(response.data);
      var profileData = MeDetailsModel.fromJson(response.data);
      notificationCount.value = response.meta['push_notification_count'];

      await PreferenceUtils.setBool(AppConstants.PASSWORD_PROMPT, (profileData.promptPassword ?? 0) == 1);
      if (profileData.currencySymbol != null || profileData.currencySymbol != "") PreferenceUtils.setString(AppConstants.CURRENCY_SYMBOL, (profileData.currencySymbol!));
    }
    // initUniLinks();
  }

  Future<void> getAllCountry() async {
    allCountries.clear();

    var response = await ApiRepo.getWithToken(ApiConst.getAllCountry + "?order_field=id&order_sort=ASC");

    if (response.status == 0) {
      // ApiRepo.showToast(response.message);
    } else {
      if (response.data is Iterable) {
        for (var i in response.data) {
          allCountries.add(CountryCodeModel.fromJson(i));
        }
      }
      print(allCountries.length);
    }
  }

  Future<void> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // Future.delayed(const Duration(seconds: 3), () async {
      final initialUri = await getInitialUri();

      // print("initialUri : ${initialUri}");
      // ApiRepo.showToast(initialUri?.toString() ?? "not found");
      if (initialUri != null) {
        print(initialUri.pathSegments);
        print(initialUri.data.toString());
        if (initialUri.pathSegments.isNotEmpty && initialUri.pathSegments[0] == "reset-password") {
          bool isValid = await Get.put(PinPasswordForgotController()).verifyTokenForForgotPassword(initialUri.pathSegments[1]);
          if (isValid) {
            Get.toNamed("/resetPass", arguments: {"token": initialUri.pathSegments[1]});
          }
        }

        if (initialUri.pathSegments.isNotEmpty && initialUri.pathSegments[0] == "reset-pin") {
          bool isValid = await Get.put(PinPasswordForgotController()).verifyTokenForForgotPin(initialUri.pathSegments[1]);
          if (isValid) {
            Get.toNamed("/ForgotPinField", arguments: {"token": initialUri.pathSegments[1]});
          }
        }
        if (initialUri.pathSegments.isNotEmpty && initialUri.pathSegments[0] == "verify-email") {
          await Get.put(EmailFaceValidationController()).verifyTokenForEmailVarification(initialUri.pathSegments[1]);
        }
        if (initialUri.pathSegments.isNotEmpty && (initialUri.pathSegments[0] == "login-invite" || initialUri.pathSegments[0] == "signup-invite")) {
          print("my member ${initialUri.pathSegments[0]}");
          await verifyMemberExist(initialUri.pathSegments[1]);
        }
      } else {
        var userId = PreferenceUtils.getUserId;
        if (userId != 0) {
          await getMeData();
          getUserData();
        } else {
          Get.offNamed("/getStarted");
        }
      }
      // ApiRepo.showToast(initialUri.toString());
      // });

      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?
    }
  }

  Future<void> verifyMemberExist(String token) async {
    var response = await ApiRepo.get(ApiConst.isExistingMember + token);
    if (response.status == 0) {
      inviteMemberDetails.value = null;
      Get.off(GetStartedScreen());
      // ApiRepo.showToast(response.message);
    } else {
      print(response.data);
      inviteMemberDetails.value = MemberInviteDetails.fromJson(response.data);

      if (((inviteMemberDetails.value?.isUserExist ?? 0) == 1)) {
        var userId = PreferenceUtils.getUserId;
        if (userId != 0) {
          // Get.to(WelcomePage());
          // Get.offAll(() => BottomNav());
          // Get.offAllNamed("/signIn");
          // show screen to user success.
          if (inviteMemberDetails.value?.userId == userId) {
            Get.offAllNamed("/signIn");
          } else {
            PreferenceUtils.delete();
            Get.to(FirstSignIn());
          }
        } else {
          Get.to(FirstSignIn());
        }
      } else {
        // ApiRepo.showToast(response.message);
        PreferenceUtils.delete();
        Get.offAll(GetStartedScreen());
      }
    }
  }*/
}