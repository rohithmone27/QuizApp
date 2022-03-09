import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';
import 'package:quizapp/question.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'Who is the President of India?',
      'answers': [
        {'text': 'Amit Shah', 'score': 0},
        {'text': 'Narendra Modi', 'score': 0},
        {'text': 'Ramnath Kovind', 'score': 5},
        {'text': 'Mamata Banerjee', 'score': 0},
      ],
    },
    {
      'questionText': 'Who is the current Indain Captain of India?',
      'answers': [
        {'text': 'Rohith Sharma', 'score': 0},
        {'text': 'Virat Kohli', 'score': 5},
        {'text': 'Yuvraj Singh', 'score': 0},
        {'text': 'Jaspreet Bumrah', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s the capital of Rajasthan?',
      'answers': [
        {'text': 'Hyderabad', 'score': 0},
        {'text': 'Banglore', 'score': 0},
        {'text': 'Punjab', 'score': 5},
        {'text': 'Panaji', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s the role of Satya Nadella in Microsoft?',
      'answers': [
        {'text': 'CEO', 'score': 5},
        {'text': 'CMO', 'score': 0},
        {'text': 'CTO', 'score': 0},
        {'text': 'CCO', 'score': 0},
      ],
    },
    {
      'questionText': 'Where\'s Taj Mahal located?',
      'answers': [
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Megahlaya', 'score': 0},
        {'text': 'Kolkata', 'score': 0},
        {'text': 'Agra', 'score': 5},
      ],
    },
  ];
  var questionIndex = 0;
  var totalScore = 0;
  var selectRadio = 'hi';
  void _resetQuiz(){
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }
  void selectedRadioValue(var val){
    setState(() {
      selectRadio = val;
    });
  }
  void _moveToNext(){
    setState(() {
      List<Map<String, Object>> list = questions[questionIndex]['answers'];
      for(int i=0; i<4; i++){
        if(list[i]['text'] == selectRadio){
          totalScore  += list[i]['score'];
        }
      }
      questionIndex = questionIndex + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.lightGreen[100],
          appBar: AppBar(
            title: Text('Quiz App'),
            backgroundColor: Colors.lightGreen,
          ),
          body: questionIndex < questions.length
              ? Column(
                  children: [
                    Question(questions[questionIndex]['questionText']),
                    SizedBox(height: 5),
                    ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                      return Answer(selectedRadioValue, selectRadio, answer['text']);
                    }).toList(),
                    SizedBox(height: 15),
                    RaisedButton(
                      child: questionIndex != questions.length-1 ? Text('NEXT') : Text('SUBMIT'),
                      onPressed: _moveToNext,
                    ),
                  ],
                )
              : Result(totalScore, _resetQuiz)),
    );
  }
}
