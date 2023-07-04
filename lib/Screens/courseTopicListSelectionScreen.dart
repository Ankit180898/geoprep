import 'package:flutter/material.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Controller/auth_controller/registration_controller.dart';
import 'package:geoprep/Screens/auth%20screen/signup_screen.dart';
import 'package:get/get.dart';

import '../Controller/Dashboard/dashboard_controller.dart';
import '../all_colors.dart';
class CourseTopicListSelectionScreen extends StatefulWidget {
  const CourseTopicListSelectionScreen({Key? key}) : super(key: key);

  @override
  State<CourseTopicListSelectionScreen> createState() => _CourseTopicListSelectionScreenState();
}

class _CourseTopicListSelectionScreenState extends State<CourseTopicListSelectionScreen> {

  var controller=Get.find<DashBoardController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Topic Selection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>
                  ListView.builder(
                    itemCount: controller.courseTopicsList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      var i=controller.courseTopicsList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          onTap: (){
                            print("my topic key:${i.topicKey}");
                            PreferenceUtils.setString("topicKey", "${i.topicKey}");
                            controller.topicKeys=i.topicKey;
                            controller.getChapterList();
                          },
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: LinearGradient(
                                colors: [Style.lightyellow, Colors.lightBlueAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Image.network("https://www.epw.in/system/files/book%20rev.png",width: 50,height: 50,),
                                  SizedBox(width:200,child: Text("${i.topicName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),)),


                                ],
                              ),
                            ),
                          ),
                        ),
                      );

                    },
                  ),
              ),


              // Obx(()=>
              //     GridView.builder(
              //       itemCount: controller.courseTopicsList.length,
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
              //       ),
              //       itemBuilder: (BuildContext context, int index){
              //         var i=controller.courseTopicsList[index];
              //         return InkWell(
              //             onTap: (){
              //               print("my topic key:${i.topicKey}");
              //               PreferenceUtils.setString("topicKey", "${i.topicKey}");
              //               controller.topicKeys=i.topicKey;
              //               controller.getChapterList();
              //
              //
              //             },
              //             child:Container(
              //               decoration: BoxDecoration(
              //                 gradient: LinearGradient(
              //                   colors: [Style.lightyellow, Colors.lightBlueAccent],
              //                   begin: Alignment.bottomLeft,
              //                   end: Alignment.topRight,
              //                 ),
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Image.network("https://www.epw.in/system/files/book%20rev.png"),
              //                     const SizedBox(height: 10,),
              //                     Text("${i.topicName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
              //                     // Text("",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
              //                   ],
              //                 ),
              //               ),
              //             )
              //         );
              //       },
              //     ))

            ],
          ),
        ),
      ),
    );
  }
}
