import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Constant/PreferenceUtils.dart';
import 'package:geoprep/Screens/dashboard_screen.dart';
import 'package:geoprep/Screens/auth%20screen/login_screen.dart';
import 'package:get/get.dart';

import '../../Controller/auth_controller/registration_controller.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../components/square_tile.dart';

class SignUpScreen extends StatelessWidget {

  // text editing controllers


  // sign user in method
  void signUserIn() {}
  var controller=Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 25),

                    // logo
                    Hero(
                      tag: 'logoanimate',
                      child: Image.asset(
                        "assets/images/geoprep.png",
                        height: 50, width: 70,
                      ),
                    ),

                    const SizedBox(height: 25),

                    // welcome back, you've been missed!
                    Text(
                      'Welcome back you\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 14, fontFamily: 'Lexend'
                      ),
                    ),

                    const SizedBox(height: 13),

                    // username textfield
                    MyTextField(
                      controller: controller.usernameController,
                      hintText: 'Full name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: controller.phoneNoController,
                      hintText: 'Contact no',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: controller.emailController,
                      hintText: 'Email',
                      obscureText: false,
                    ),

                    const SizedBox(height: 10),

                    // password textfield
                    MyTextField(
                      controller: controller.passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 25),

                    // sign in button
                    controller.isLoading.value==true?CircularProgressIndicator():MyButton(
                      onTap:(){
                         controller.registerWithEmail();
                      },
                      btnText: "Sign Up",
                    ),

                    // google + apple sign in buttons

                    const SizedBox(height: 25),

                    // not a member? register now
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a member?',
                          style: TextStyle(color: Colors.grey[700],fontFamily: 'Lexend'),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: (){
                            Get.offAll(LogInScreen());
                          },
                           child: Text(
                            'Login now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,fontFamily: 'Lexend'
                            ),
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
    );
  }
}
