import 'package:flutter/material.dart';
import 'package:geoprep/Screens/Material%20Screen/video_player_exmaple.dart';
import 'package:get/get.dart';

import '../../Controller/Dashboard/dashboard_controller.dart';
import '../../all_colors.dart';
class VideoMaterialScreen extends StatefulWidget {
  const VideoMaterialScreen({Key? key}) : super(key: key);

  @override
  State<VideoMaterialScreen> createState() => _VideoMaterialScreenState();
}

class _VideoMaterialScreenState extends State<VideoMaterialScreen> {

  var controller=Get.find<DashBoardController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.lightGray,
      appBar: AppBar(
        title: Text("Video Material Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Obx(()=>
                GridView.builder(
                  itemCount: controller.videoMaterialsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
                  ),
                  itemBuilder: (BuildContext context, int index){
                    var i=controller.videoMaterialsList[index];
                    return InkWell(
                        onTap: (){
                          Get.to(VideoPlayerExample(),arguments: "${i.videoMaterialFileUrl}");


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
                                Text("${i.videoMaterialDecription}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
                                // Text("",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
                              ],
                            ),
                          ),
                        )
                    );
                  },
                )),

          ],
        ),
      ),
    );
  }
}
