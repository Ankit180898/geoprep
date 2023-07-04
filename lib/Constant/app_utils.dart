import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../all_colors.dart';
import '../text_style.dart';

class AppUtils {
  static StreamSubscription? subscription;
  static void startCheckingForInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Get.defaultDialog(
          title: "",
          barrierDismissible: false,
          onWillPop: () {
            return Future.value(false);
          },
          content: Column(
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: 80,
                color: Style.pDXBeam_azure_green,
              ),
              const SizedBox(height: 10),
              Text("No Internet connection", style: TextStyles.ts16W600H26.copyWith(fontSize: 22))
            ],
          ));
    }
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print("Connectivity() $result");
      if (result == ConnectivityResult.none) {
        Get.defaultDialog(
            title: "",
            barrierDismissible: false,
            onWillPop: () {
              return Future.value(false);
            },
            content: Column(
              children: [
                Icon(
                  Icons.wifi_off_rounded,
                  size: 80,
                  color: Style.pDXBeam_azure_green,
                ),
                const SizedBox(height: 10),
                Text("No Internet connection", style: TextStyles.ts16W600H26.copyWith(fontSize: 22))
              ],
            ));
      } else {
        Get.back();
      }
    });
  }

  static void stopCheckingForInternet() {
    subscription?.cancel();
  }

  static Widget cachedImage(String url, {BoxFit? fit}) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
