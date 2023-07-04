import 'package:flutter/material.dart';
import 'package:geoprep/Screens/bottom_nav_widget.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key}) : super(key: key);

  String get resultPhrase {
    String resultText = 'You did it!';
    if (resultScore >= 8) {
      resultText = 'Distinction :) \n\n You did great $resultScore \n';
    } else if (resultScore >= 5) {
      resultText = '\n Average\n Need to work more $resultScore\n';
    } else {
      resultText = '\n Poor score :( \n Please work hard $resultScore';
    }
    return resultText;
  }




  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: const Text(
                'Restart test !',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: resetHandler,
            ),
            TextButton(
              child: const Text(
                'Home',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: (){
                Get.offAll(BottomNav());
              },
            ),

          ],
        ),
      ),
    );
  }
}