import 'package:flutter/material.dart';
import 'package:geoprep/Controller/Dashboard/dashboard_controller.dart';
import 'package:geoprep/Controller/auth_controller/registration_controller.dart';
import 'package:get/get.dart';

import '../all_colors.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {

  var controller=Get.find<DashBoardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  InkWell(
                          onTap: (){
                            controller.getCourseTopicList();
                          },
                          child:Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Style.lightyellow, Colors.lightBlueAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network("https://www.epw.in/system/files/book%20rev.png"),
                                  const SizedBox(height: 10,),
                                  Text("${controller.courseDetail}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
                                ],
                              ),
                            ),
                          )

                      )
            ],
          ),
        ),
      ),
    );
  }
}
