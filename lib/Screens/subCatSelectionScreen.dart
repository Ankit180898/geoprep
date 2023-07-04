import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:geoprep/Controller/auth_controller/registration_controller.dart';
import 'package:geoprep/Screens/auth%20screen/signup_screen.dart';
import 'package:geoprep/Screens/courseListSelectionScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../all_colors.dart';
class SubCategorySelectionScreen extends StatefulWidget {
  const SubCategorySelectionScreen({Key? key}) : super(key: key);

  @override
  State<SubCategorySelectionScreen> createState() => _SubCategorySelectionScreenState();
}

class _SubCategorySelectionScreenState extends State<SubCategorySelectionScreen> {

  var controller=Get.find<RegistrationController>();

  var isCategory=true.obs;
  bool checkbottom=false;


  @override
  Widget build(BuildContext context) {
    print("${controller.subCategoryList.length}");
    YYDialog.init(context);
    return Scaffold(
      bottomSheet: checkbottom==false?null:bottomSheet(context),
      appBar: AppBar(
        title: const Text("SubCategory Selection"),
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
                    itemCount: controller.subCategoryList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,

                    itemBuilder: (BuildContext context, int index) {
                      var i=controller.subCategoryList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: InkWell(
                            onTap: (){
                              controller.subCategorySelected=i.subCategoryKey;
                              setState(() {
                                if(checkbottom==false){
                                  checkbottom=true;
                                }else{
                                  checkbottom=false;

                                }
                              });
                              // controller.getCourseList(i.subCategoryKey.toString());
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
                                  CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    imageUrl: "${i.subCategoryLogoUrl}",
                                    placeholder: (context, url) => new CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Image.network("https://www.epw.in/system/files/book%20rev.png",width: 50,height: 50,),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width:200,child: Text("${i.subCategoryName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),)),
                                      SizedBox(height: 10,),
                                      SizedBox(width:200,child: Text("${i.subCategoryDecription}",overflow:TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),)),

                                    ],
                                  ),


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
              //       itemCount: controller.subCategoryList.length,
              //       physics: NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3,
              //           childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 10
              //       ),
              //       itemBuilder: (BuildContext c, int index){
              //         var i=controller.subCategoryList[index];
              //         return InkWell(
              //             onTap: (){
              //               controller.subCategorySelected=i.subCategoryKey;
              //               setState(() {
              //                 if(checkbottom==false){
              //                   checkbottom=true;
              //                 }else{
              //                   checkbottom=false;
              //
              //                 }
              //               });
              //               // controller.getCourseList(i.subCategoryKey.toString());
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
              //                     Text("${i.subCategoryName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
              //                     Text("${i.subCategoryDecription}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
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
   bottomSheet(BuildContext context){
    bool valuefirst = false;
    bool valuesecond = false;
    bool valuethree = false;

         return  Container(
            height: 300,
            color: Colors.black12,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text("Select language",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                controller.chooseLanguagePopSelected="1";
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "English",
                                style: TextStyle(color: Colors.white),
                              ),
                              fillColor: const Color(0xFF1BC0C5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,

                        child: Row(
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                controller.chooseLanguagePopSelected="2";
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "বাংলা",
                                style: TextStyle(color: Colors.white),
                              ),
                              fillColor: const Color(0xFF1BC0C5),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,

                        child: Row(

                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                controller.chooseLanguagePopSelected="1,2";
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "Both",
                                style: TextStyle(color: Colors.white),
                              ),
                              fillColor: const Color(0xFF1BC0C5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: RawMaterialButton(
                  //     onPressed: () {
                  //       Get.to(SignUpScreen());
                  //     },
                  //     child: Text(
                  //       "Continue",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     fillColor: const Color(0xFF1BC0C5),
                  //   ),
                  // )
                ],
              ),
            ),
          );

  }
}
