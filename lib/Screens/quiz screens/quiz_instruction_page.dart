import 'package:flutter/material.dart';
import 'package:geoprep/Screens/quiz%20screens/quiz_demo_screen.dart';
import 'package:get/get.dart';

import 'main_question_screen.dart';

class QuizInstructionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 50,
          width: double.infinity,
          child: RawMaterialButton(
            elevation: 0,
            fillColor: Colors.blue,
            textStyle: TextStyle(color: Colors.white),
            onPressed: () {
              // Navigate to the quiz page
              Get.to(QuizDemoScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Start Quiz'),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Quiz Instructions'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Instructions:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '1. Read each question carefully before selecting an answer.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '2. You can only select one answer for each question.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '3. Once you select an answer, it cannot be changed.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '4. After answering all questions, submit your quiz for evaluation.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '5. Good luck!',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }
}
