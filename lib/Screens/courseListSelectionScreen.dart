import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/Dashboard/dashboard_controller.dart';
import '../Controller/auth_controller/registration_controller.dart';
import '../all_colors.dart';
class CourseListSelectionScreen extends StatefulWidget {
  const CourseListSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CourseListSelectionScreen> createState() => _CourseListSelectionScreenState();
}

class _CourseListSelectionScreenState extends State<CourseListSelectionScreen> {

  var controller=Get.find<DashBoardController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Selection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>
                  GridView.builder(
                    itemCount: controller.coursesListSelection.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
                    ),
                    itemBuilder: (BuildContext context, int index){
                      var i=controller.coursesListSelection[index];
                      return InkWell(
                          onTap: (){
                            controller.getCourseDetails(i.courseKey.toString());
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
                                  Text("${i.courseName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
                                  Text("${i.categoryDecription}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
                                ],
                              ),
                            ),
                          )
                      );
                    },
                  ))

            ],
          ),
        ),
      ),
    );
  }
}
