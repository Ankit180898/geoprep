import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_imei/device_imei.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Controller/Dashboard/dashboard_controller.dart';
import 'package:geoprep/Controller/auth_controller/registration_controller.dart';
import 'package:geoprep/Screens/Material%20Screen/pdf_view_screen.dart';
import 'package:geoprep/Screens/courseDetailsScreen.dart';
import 'package:geoprep/Screens/quiz%20screens/main_question_screen.dart';
import 'package:geoprep/Screens/quiz%20screens/quiz_instruction_page.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../all_colors.dart';
import '../custom_appbar/custom_dashboard_appbar.dart';
import 'components/itams.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  var controller=Get.put(DashBoardController());

  Items item1 = new Items(
      title: "Class X",
      subtitle: "(WBBSC)",
      event: "3 Test Available",
      img: "assets/images/class10.png");



  Items item2 = new Items(
    title: "Class XII",
    subtitle: "(WBCHSE)",
    event: "3 Test Available",
    img: "assets/images/class10.png",
  );

  Items item3 = new Items(
    title: "Class XII",
    subtitle: "(CBSE)",
    event: "3 Test Available",
    img: "assets/images/class10.png",
  );

  Items item4 = new Items(
    title: "UG CUET",
    subtitle: "",
    event: "3 Test Available",
    img: "assets/images/class10.png",
  );

  Items item5 = new Items(
    title: "PG CUET",
    subtitle: "",
    event: "4 Items",
    img: "assets/images/class10.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
    ];
    final List<String> imageList = [
      "assets/images/banner1.jpeg",
      "assets/images/banner2.jpeg",
      "assets/images/banner1.jpeg",
      "assets/images/banner2.jpeg",


    ];
    var size=MediaQuery.of(context).size;
    // CarouselController carouselControllercontroller = CarouselController();

    return Scaffold(
      backgroundColor: Style.white_color,
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Obx(()=>
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                    child: Center(
                      child: CarouselSlider(

                        options: CarouselOptions(
                          enlargeCenterPage: false,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: imageList
                            .map((e) => Padding(
                              padding: const EdgeInsets.only(right: 10.0,left: 10.0),
                              child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      e,
                                      width: MediaQuery.of(context).size.width,
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                            ))
                            .toList(),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Card(
                  //     shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(15))
                  //     ),
                  //     elevation: 2,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: CircularPercentIndicator(
                  //               radius: 80.0,
                  //               lineWidth: 13.0,
                  //               animation: true,
                  //               percent: 0.7,
                  //               center: new Text(
                  //                 "70.0%",
                  //                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  //               ),
                  //               footer: new Text(
                  //                 "Your Performance",
                  //                 style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                  //               ),
                  //               circularStrokeCap: CircularStrokeCap.round,
                  //               progressColor: Colors.blue[700],
                  //             ),
                  //           ),
                  //           SizedBox(width: 15,),
                  //           Expanded(
                  //             child: Padding(
                  //               padding: EdgeInsets.all(15.0),
                  //               child: CircularPercentIndicator(
                  //                 radius: 60.0,
                  //                 lineWidth: 5.0,
                  //                 percent: 0.98,
                  //                 center:  const Text("98%"),
                  //                 progressColor: Colors.green,
                  //                 footer: Text(
                  //                   "Topper Performance",
                  //                   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 10.0),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [

                        Expanded(
                          child: Container(
                            decoration:BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              gradient: LinearGradient(
                                colors: [Style.lightyellow, Colors.lightBlueAccent],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: 0.7,
                                center: new Text(
                                  "70.0%",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                footer: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: new Text(
                                    "Your Performance",
                                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.square,
                                progressColor: Colors.blue[700],
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Container(

                            decoration:BoxDecoration(
                              boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                        gradient: LinearGradient(
                        colors: [Style.lightyellow, Colors.lightBlueAccent],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(15),
                        ) ,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircularPercentIndicator(
                                radius: 60.0,
                                lineWidth: 8.0,
                                animation: true,
                                percent: 0.95,
                                center: new Text(
                                  "98%",
                                  style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                ),
                                footer: Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Topper Performance",
                                    style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.butt,
                                progressColor: Colors.green,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Text("Course Lists",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,),),
                  ),
                  Obx(()=>
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GridView.builder(
                          itemCount: controller.coursesListSelection.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 20 / 20, crossAxisSpacing: 10, mainAxisSpacing: 5
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
                        ),
                      ))




                ],
              ),
              controller.isLoading.value==true?CircularProgressIndicator():SizedBox()

            ],
          ),

        ),
      ),
    );
  }
}
