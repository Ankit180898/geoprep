import 'package:flutter/material.dart';
import 'package:geoprep/Controller/Dashboard/dashboard_controller.dart';
import 'package:geoprep/Screens/Material%20Screen/pdf_view_screen.dart';
import 'package:geoprep/Screens/Material%20Screen/video_player_exmaple.dart';
import 'package:geoprep/Screens/quiz%20screens/main_question_screen.dart';
import 'package:geoprep/Screens/quiz%20screens/quiz_instruction_page.dart';
import 'package:get/get.dart';

import '../Constant/PreferenceUtils.dart';
import '../all_colors.dart';
import 'Material Screen/materialScreen.dart';
import 'Material Screen/videoMaterialScreen.dart';
class ChapterListSelectionScreen extends StatefulWidget {
  const ChapterListSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ChapterListSelectionScreen> createState() => _ChapterListSelectionScreenState();
}

class _ChapterListSelectionScreenState extends State<ChapterListSelectionScreen> {

  var controller=Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter list Selection"),
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
                    itemCount: controller.courseChapterList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      var i=controller.courseChapterList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                          onTap: (){
                            print("my topic key:${i.topicKey}");
                            if(PreferenceUtils.getString("index")=="0"){
                              Get.to(QuizInstructionsPage());
                            }else if(PreferenceUtils.getString("index")=="1"){
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext bc){
                                    return Container(
                                      child: Wrap(
                                        children: <Widget>[
                                          ListTile(
                                              leading: Icon(Icons.text_format),
                                              title: Text('Text'),
                                              onTap: () => {
                                                controller.getTextMaterials(i.chapterKey.toString())

                                              }
                                          ),
                                          new ListTile(
                                            leading: new Icon(Icons.videocam),
                                            title: new Text('Video'),
                                            onTap: () => {
                                              Get.to(VideoPlayerExample())


                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                              );
                            }
                            else{
                              Get.to(QuizInstructionsPage());
                            }


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
                                  Container(width:size.width*0.60,child: Text("${i.chapterName}",overflow:TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),)),


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
              //       itemCount: controller.courseChapterList.length,
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
              //       ),
              //       itemBuilder: (BuildContext context, int index){
              //         var i=controller.courseChapterList[index];
              //         return InkWell(
              //             onTap: (){
              //               print("my topic key:${i.topicKey}");
              //               if(PreferenceUtils.getString("index")=="0"){
              //                 Get.to(Home());
              //               }else if(PreferenceUtils.getString("index")=="1"){
              //                 showModalBottomSheet(
              //                     context: context,
              //                     builder: (BuildContext bc){
              //                       return Container(
              //                         child: Wrap(
              //                           children: <Widget>[
              //                             ListTile(
              //                                 leading: Icon(Icons.text_format),
              //                                 title: Text('Text'),
              //                                 onTap: () => {
              //                                   controller.getTextMaterials(i.chapterKey.toString())
              //
              //                                 }
              //                             ),
              //                             new ListTile(
              //                               leading: new Icon(Icons.videocam),
              //                               title: new Text('Video'),
              //                               onTap: () => {
              //                                 Get.to(VideoPlayerExample())
              //
              //
              //                               },
              //                             ),
              //                           ],
              //                         ),
              //                       );
              //                     }
              //                 );
              //               }
              //               else{
              //                 Get.to(Home());
              //               }
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
              //                     Text("${i.chapterName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
              //                     // Text("${i.courseName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
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
