import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Screens/components/navdrawer.dart';

import '../all_colors.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => AppBar().preferredSize;
  ValueNotifier<int> notificationCount = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.84, 0.54),
              end: Alignment(0.84, -0.54),
              colors: [Color(0xFF3550DC), Color(0xFF27E9F7)],
            ),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: ()=>Scaffold.of(context).openDrawer(),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/demo_profile.jpg'),
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Container(
              height: 60,
              padding: EdgeInsets.all(10),
              child: TextField(
                 /* onChanged: onTextChange,*/
                cursorColor: Colors.black,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                      hintText: 'Search here ...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.zero
                  )
              )
          )
        ],
      ),
      actions: [ValueListenableBuilder(
          valueListenable: notificationCount,
          builder: (context, int? value, child) {
            return IconButton(
              constraints: const BoxConstraints(
                maxHeight: 22,
                maxWidth: 38,
              ),
              onPressed: () {
                PreferenceUtils.delete();
               /* if (fromNotification) {
                  Get.back();
                }
                Get.to(NotificationScreen());*/
              },
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
              // icon: Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     const Icon(
              //       Icons.power_settings_new,
              //       color: Colors.black,
              //     ),
              //     if (value! == 0)
              //       const Positioned(
              //         right: -1,
              //         top: -1,
              //         child: SizedBox(
              //           child: CircleAvatar(
              //             backgroundColor: Colors.red,
              //             radius: 7,
              //             // radius: 4,
              //             child: Text(
              //               "9+",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.w700,
              //                 fontSize: 10,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //   ],
              // ),
            );
          })],
      //bottom: Icons.notifications,
    );
  }
}