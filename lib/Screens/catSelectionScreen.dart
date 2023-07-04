import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Controller/auth_controller/registration_controller.dart';
import 'package:geoprep/Screens/auth%20screen/signup_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../all_colors.dart';
class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {

  var controller=Get.put(RegistrationController());
  var isCategory=true.obs;

  @override
  Widget build(BuildContext context) {
    print("${controller.categoryList.length}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Selection"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select the goal you want",style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Roobert",fontSize: 20,color: Colors.black,),),
              SizedBox(height: 15,),

              Obx(()=>
                 ListView.builder(
                  itemCount: controller.categoryList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemBuilder: (BuildContext context, int index) {
                    var i=controller.categoryList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: InkWell(
                        onTap: (){
                          controller.categorySelected=i.categoryKey;
                          controller.getSubCategory(i.categoryKey.toString());
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              width: 50,
                              height: 50,
                              imageUrl: "${i.categoryLogoUrl}",
                              placeholder: (context, url) => new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.network("https://www.epw.in/system/files/book%20rev.png",width: 50,height: 50,),
                            ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width:200,child: Text("${i.categoryName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Roobert",fontSize: 16,color: Colors.black,),)),
                                SizedBox(height: 10,),
                                SizedBox(width:200,child: Text("${i.categoryDecription}",overflow:TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 13,color:Colors.black.withOpacity(0.5),),)),
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
      //        Obx(()=>
      //     GridView.builder(
      //     itemCount: controller.categoryList.length,
      //     physics: NeverScrollableScrollPhysics(),
      //     shrinkWrap: true,
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3,
      //         childAspectRatio: 17 / 20, crossAxisSpacing: 10, mainAxisSpacing: 10
      //     ),
      //     itemBuilder: (BuildContext context, int index){
      //       var i=controller.categoryList[index];
      //       return InkWell(
      //           onTap: (){
      //             controller.categorySelected=i.categoryKey;
      //             controller.getSubCategory(i.categoryKey.toString());
      //           },
      //           child:Container(
      //             decoration: BoxDecoration(
      //               gradient: LinearGradient(
      //                 colors: [Style.lightyellow, Colors.lightBlueAccent],
      //                 begin: Alignment.bottomLeft,
      //                 end: Alignment.topRight,
      //               ),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Image.network("https://www.epw.in/system/files/book%20rev.png"),
      //                   const SizedBox(height: 10,),
      //                   Text("${i.categoryName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),),
      //                   Text("${i.categoryDecription}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c),),)
      //                 ],
      //               ),
      //             ),
      //           )
      //       );
      //     },
      // ))

            ],
          ),
        ),
      ),
    );
  }
}
