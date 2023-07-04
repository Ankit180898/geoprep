import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controller/splash_controller.dart';
import 'auth screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller=Get.put(SplashController());
  @override
  void initState() {
    super.initState();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),),
          child: Center(
            child: Column(
              children: [
                Spacer(),
                Hero(
                  tag: 'logoanimate',
                  child: Image.asset(
                    "assets/images/geoprep.png",
                    height: Get.width * .7, width: Get.width * .7,
                  ),
                ),
                Text('G E O P R E P',style: TextStyle(fontFamily: "Lexend",fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white),),
                //SvgPicture.asset("assets/SVG/logo_white.svg",height: 150,width: 150,),
                Spacer(),
                Text(
                  "© 2023 Geoprep",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
