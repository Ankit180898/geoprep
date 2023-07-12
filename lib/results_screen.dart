import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/quiz/quiz_contrioller.dart';
import 'Screens/bottom_nav_widget.dart';
import 'Screens/components/my_button.dart';


class ResultDemoScreen extends StatelessWidget {
  const ResultDemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: GetBuilder<QuizController>(
                init: Get.find<QuizController>(),
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Congratulation',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      controller.name,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Your Score is',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${controller.scoreResult.round()} /100',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MyButton(
                      onTap: () {  controller.startAgain(); }, btnText: 'Start Again',),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onTap: () {  Get.offAll(BottomNav()); }, btnText: 'Home',),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}