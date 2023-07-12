import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geoprep/Screens/Material%20Screen/subMaterialScreen.dart';
import 'package:geoprep/Screens/payments/payment_page.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:geoprep/Api_repository/ApiRepo.dart';

import '../Constant/PreferenceUtils.dart';
import '../Constant/app_constants.dart';
import '../all_colors.dart';
import '../main.dart';
import 'Material Screen/materialScreen.dart';
import 'dashboard_screen.dart';

Style style = new Style();

class BottomNav extends StatefulWidget {
  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  int index_x = 0;

  final screens = [
    DashboardScreen(),
    const SubMaterialScreen(),
    const PaymentPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      index_x = index;
      PreferenceUtils.setString("index", "$index_x");
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: screens[index_x],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.file_present_rounded),
                label: 'Materials',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/geoprep.png',
                  width: 30.0,
                  height: 30.0,
                ),
                label: 'Plans',
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: index_x,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              color: Style.primaryJetBlack,
              fontSize: 12,
            ),
            iconSize: 30,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

class CategorySeparator extends StatelessWidget {
  final String title;

  CategorySeparator({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Style.blue, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(
              'View all',
              style: TextStyle(
                  color: style.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 8.0,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 12.0,
              color: Colors.red,
            ),
          ],
        )
      ],
    );
  }
}
