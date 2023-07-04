import 'package:geoprep/Screens/auth%20screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:geoprep/Api_repository/ApiRepo.dart' as ApiRepo;

import '../Constant/app_utils.dart';
import '../Constant/const.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class BoardController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    main();
  }

  void main() async {
    var headers = {
      'Cookie': 'PHPSESSID=fo5irdvhu74atnlb3otqsenhr4'
    };
    var request = http.Request('GET', Uri.parse('https://geoprep.in/api/school-boards.php'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print("Success data");
    }
    else {
      print(response.reasonPhrase);
      print("Failed data");
    }

  }


}