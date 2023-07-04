import 'package:flutter/material.dart';
import 'package:geoprep/Screens/Material%20Screen/pdf_view_screen.dart';
import 'package:get/get.dart';

import '../../Controller/Dashboard/dashboard_controller.dart';
import '../../all_colors.dart';
class MaterialScreen extends StatefulWidget {
  const MaterialScreen({Key? key}) : super(key: key);

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {

  var controller=Get.find<DashBoardController>();


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
        child: Column(
          children: [
            Obx(()=>
                ListView.builder(
                  itemCount: controller.textMaterialsList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemBuilder: (BuildContext context, int index) {
                    var i=controller.textMaterialsList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: InkWell(
                        onTap: (){
                          print("text material: ${i.textMaterialFileUrl}");
                          Get.to(PdfViewerPage(),arguments: "${i.textMaterialFileUrl}");

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
                                SizedBox(width:200,child: Text("${i.textMaterialName}",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w700,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929),),)),


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
            //       itemCount: controller.textMaterialsList.length,
            //       physics: NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           childAspectRatio: 20 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
            //       ),
            //       itemBuilder: (BuildContext context, int index){
            //         var i=controller.textMaterialsList[index];
            //         return InkWell(
            //             onTap: (){
            //               print("text material: ${i.textMaterialFileUrl}");
            //               Get.to(PdfViewerPage(),arguments: "${i.textMaterialFileUrl}");
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
            //                     Text("${i.textMaterialName}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Roobert",fontSize: 16,color: Color(0xff292929)),),
            //                     // Text("",overflow:TextOverflow.ellipsis,maxLines: 1,style: TextStyle(fontWeight: FontWeight.w400,fontFamily: "Satoshi",fontSize: 12,color: Color(0xff6c6c6c)),)
            //                   ],
            //                 ),
            //               ),
            //             )
            //         );
            //       },
            //     )),

          ],
        ),
      ),
    );
  }

}
