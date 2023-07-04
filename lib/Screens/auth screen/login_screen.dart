import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Controller/auth_controller/login_controller.dart';
import 'package:geoprep/Screens/auth%20screen/signup_screen.dart';
import 'package:geoprep/Screens/catSelectionScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controller/board_controller.dart';
import '../../animations/page_route.dart';
import '../bottom_nav_widget.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class LogInScreen extends StatefulWidget {
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  // text editing controllers
  var controller=Get.put(LoginController());

  // final controller = Get.put(BoardController());

  // @override
  // void initState() {
  //   super.initState();
  //   // controller;
  // }
  //
  // // sign user in method
  // void signUserIn() {
  //   Go.offAll(BottomNav());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Obx(()=>
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 25),

                      // log/jo
                      Hero(
                        tag: 'logoanimate',
                        child: Image.asset(
                          "assets/images/geoprep.png",
                          height: 80,
                          width: 100,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // welcome back, you've been missed!
                      Text(
                        'Welcome back you\'ve been missed!',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                            fontFamily: 'Lexend'),
                      ),

                      const SizedBox(height: 13),

                      // username textfield
                      MyTextField(
                        controller: controller.emailController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 10),

                      // password textfield
                      MyTextField(
                        controller: controller.passController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      // const SizedBox(height: 10),
                      //
                      // // forgot password?
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       Text(
                      //         'Forgot Password?',
                      //         style: TextStyle(
                      //             color: Colors.grey[600], fontFamily: 'Lexend'),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      const SizedBox(height: 13),

                      // sign in button
                      MyButton(
                        onTap: (){
                           controller.loginWithEmail();
                      },
                        btnText: "Sign In",
                      ),

                      const SizedBox(height: 25),

                      // or continue with
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 0.5,
                      //           color: Colors.grey[400],
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //         child: Text(
                      //           'Or continue with',
                      //           style: TextStyle(
                      //               color: Colors.grey[700], fontFamily: 'Lexend'),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 0.5,
                      //           color: Colors.grey[400],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // const SizedBox(height: 25),

                      // google + apple sign in buttons
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: const [
                      //     // google button
                      //     SquareTile(imagePath: 'assets/images/google.png'),
                      //
                      //     SizedBox(width: 13),
                      //
                      //     // apple button
                      //     SquareTile(imagePath: 'assets/images/apple.png')
                      //   ],
                      // ),
                      //
                      // const SizedBox(height: 25),

                      // not a member? register now
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a member?',
                            style: TextStyle(
                                color: Colors.grey[700], fontFamily: 'Lexend'),
                          ),
                          const SizedBox(width: 4),
                          InkWell(
                            onTap: () {
                              Get.to(CategorySelectionScreen());
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lexend'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  controller.isLoading.value==true?CircularProgressIndicator():SizedBox()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
