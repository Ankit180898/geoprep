import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geoprep/Screens/quiz%20screens/quiz_screen.dart';
import 'package:geoprep/Screens/quiz%20screens/result_screen.dart';
/*import './question.dart';
import './answer.dart';*/


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  final _questions = const [
    {
      'questionText': 'The colour of the star is an indication of its',
      'answers': [
        {'text': 'Distance from the earth', 'score': 0},
        {'text': 'Distance from the sun', 'score': 1},
        {'text': 'Temperature', 'score': 0},
        {'text': 'Luminosity', 'score': 0},

      ],
    },
    {
      'questionText':
      'The planet nearest to the sun is',
      'answers': [
        {'text': 'Mercury', 'score': 1},
        {'text': 'Earth', 'score': 0},
        {'text': 'Venus', 'score': 0},
        {'text': 'Pluto', 'score': 0},
      ],
    },
    {
      'questionText': 'The group of stars arranged in a definite pattern is called',
      'answers': [
        {'text': 'Milky way', 'score': 0},
        {'text': 'Constellation', 'score': 1},
        {'text': 'Andromeda', 'score': 0},
        {'text': 'Solar system', 'score': 0},
      ],
    },
    {
      'questionText':
      'The Asteroid belt is found between which of the following?',
      'answers': [
        {'text': 'Earth and Mars', 'score': 1},
        {'text': 'Jupiter and Saturn', 'score': 0},
        {'text': 'Mars and Jupiter', 'score': 0},
        {'text': 'Saturn and Uranus', 'score': 0},
      ],
    },
    {
      'questionText': 'Which one of the following is the largest satellite in solar system?',
      'answers': [
        {'text': 'Ganymede', 'score': 1},
        {'text': 'Titan', 'score': 0},
        {'text': 'Europa', 'score': 0},
        {'text': 'Triton', 'score': 0},
      ],
    },
    {
      'questionText':
      'Which planet takes the longest time to go around the sun?',
      'answers': [
        {'text': 'Earth', 'score': 1},
        {'text': 'Jupiter', 'score': 0},
        {'text': 'Uranus', 'score': 0},
        {'text': 'Neptune', 'score': 0},
      ],
    },
    {
      'questionText':
      'Which of the following is the nearest star of Earth?',
      'answers': [
        {'text': 'Sirius', 'score': 0},
        {'text': 'Sun', 'score': 1},
        {'text': 'Rigel', 'score': 0},
        {'text': 'Vega', 'score': 0},
      ],
    },
    {
      'questionText':
      'Which one of the following planets is the brightest?',
      'answers': [
        {'text': 'Mars', 'score': 0},
        {'text': 'Mercury', 'score': 0},
        {'text': 'Venus', 'score': 0},
        {'text': 'Jupiter', 'score': 1},

      ],
    },
    {
      'questionText':
      'The mean radius of the Earth is',
      'answers': [
        {'text': '3200 km', 'score': 0},
        {'text': '6400 km', 'score': 0},
        {'text': '8400 km', 'score': 0},
        {'text': '12800 km', 'score': 1},

      ],
    },
    {
      'questionText':
      'Which one of the following planets rotates clockwise?',
      'answers': [
        {'text': 'Earth', 'score': 0},
        {'text': 'Mars', 'score': 0},
        {'text': 'Venus', 'score': 0},
        {'text': 'Mercury', 'score': 1},

      ],
    },



    //new questions

  ];
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {});
    _questionIndex = 0;
    _totalscore = 0;
  }

  void _answerQuestions(int score) {
    //var aBool=true;

    _totalscore = _totalscore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (kDebugMode) {
      print(_questionIndex);
    }
    if (_questionIndex < _questions.length) {
      if (kDebugMode) {
        print('We have more questions!');
      }
    } else {
      if (kDebugMode) {
        print('No more questions!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atmosphere (বায়ুমণ্ডল) ক্যুইজ'),
        backgroundColor: Colors.cyan,
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
        answerQuestions: _answerQuestions,
        questionIndex: _questionIndex,
        questions: _questions,
      ) //
          : Result(_totalscore, _resetQuiz),
    );
  }
}