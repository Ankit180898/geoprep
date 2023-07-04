import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geoprep/page_route.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Constant/PreferenceUtils.dart';
import 'all_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
/*  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);*/
  await PreferenceUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Style.pDXBeam_azure_green, scaffoldBackgroundColor: Style.white_color),
        initialRoute: "/splash",
        getPages: appGetPages);
  }
}
