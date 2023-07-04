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
  int index_x=0;

  final screens=[
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
        backgroundColor: Colors.black,
        body: screens[index_x],
        bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                  backgroundColor: Colors.grey.shade100),
              BottomNavigationBarItem(
                  icon: Icon(Icons.file_present_rounded),
                  label: 'Materials',
                  backgroundColor: Colors.grey.shade100),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/geoprep.png',
                  width: 30.0,
                  height: 30.0,
                ),
                label: 'Plans',
                backgroundColor: Colors.grey.shade300,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: index_x,
            selectedIconTheme: IconThemeData(color: Colors.lightBlueAccent),
            selectedItemColor: Colors.lightBlueAccent,
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
            elevation: 5),
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