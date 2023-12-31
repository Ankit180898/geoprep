import 'package:flutter/material.dart';
import 'package:geoprep/Screens/quiz%20screens/question_screen.dart';
import 'answer_screen.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestions;

  const Quiz(
      {Key? key,
        required this.questions,
        required this.answerQuestions,
        required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff2c3e50),
                Colors.black,
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Question(
                questions[questionIndex]['questionText'] as String,
              ),
              ...(questions[questionIndex]['answers']
              as List<Map<String, Object>>)
                  .map((answer) {
                return Answer(() => answerQuestions(answer['score']),
                    answer['text'] as String);
              }).toList()
            ],
          ),
        ));
  }
}