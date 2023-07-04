import 'package:flutter/material.dart';
import 'package:geoprep/Controller/Dashboard/dashboard_controller.dart';
import 'package:geoprep/Screens/Material%20Screen/pdf_view_screen.dart';
import 'package:geoprep/Screens/Material%20Screen/videoMaterialScreen.dart';
import 'package:geoprep/Screens/Material%20Screen/video_player_exmaple.dart';
import 'package:get/get.dart';

import '../../Constant/PreferenceUtils.dart';
import '../../all_colors.dart';
import 'materialScreen.dart';
class SubMaterialScreen extends StatefulWidget {
  const SubMaterialScreen({Key? key}) : super(key: key);

  @override
  State<SubMaterialScreen> createState() => _SubMaterialScreenState();
}

class _SubMaterialScreenState extends State<SubMaterialScreen> {
  var controller=Get.find<DashBoardController>();

  @override
  void initState() {
    controller.getCourseList(PreferenceUtils.getString("subCatKey"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.lightGray,
      appBar: AppBar(
        title: Text("Material Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
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
