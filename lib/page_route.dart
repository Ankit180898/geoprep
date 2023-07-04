import 'package:get/get.dart';

import 'Screens/splash_screen.dart';

List<GetPage<dynamic>>? appGetPages = [
  GetPage(
    name: "/splash",
    page: () => const SplashScreen(),
    transition: Transition.rightToLeft,
  ),

];
