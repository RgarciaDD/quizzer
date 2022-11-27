import 'package:flutter/material.dart';

void main() {
  runApp(Quizzer());
}

class Quizzer extends StatefulWidget {
  //const Quizzer({Key? key}) : super(key: key);

  @override
  _QuizzerState createState() => _QuizzerState();
}

class _QuizzerState extends State<Quizzer> {
  String EndMessage = 'Game Over';

  List<Widget> scoreKeeper = [];

  List<String> questionList = [
    'You can lead a cow down stairs but not upstairs',
    'Approximately one quarter of Human bones are in the feet',
    'A slugs blood is green'
  ];

  List<bool> questionAnswers = [
    true,
    false,
    true,
  ];

  int questionNumber = 0;

  Icon check = const Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon wrong = const Icon(
    Icons.close,
    color: Colors.red,
  );

  addCheck(type) {
    setState(() {
      questionNumber++;
      scoreKeeper.add(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Container(height: 250),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    questionList[questionNumber],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )),
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            // TRUE BUTTON
                            enableFeedback: false,
                            height: 100,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            color: Colors.green,
                            onPressed: () {
                              print(questionNumber);
                              bool correctAnswer = questionAnswers[questionNumber];


                              if (correctAnswer == true) {
                                addCheck(check);
                              } else {
                                addCheck(wrong);
                              }
                              if (questionNumber == questionList.length) {
                                setState(() {
                                  questionNumber = 0;
                                });
                              };

                              // setState(() {
                              //   questionNumber++;
                              //   scoreKeeper.add(const Icon(
                              //     Icons.check,
                              //     color: Colors.yellow,
                              //   ));
                              // });
                            },
                            child: const Text(
                              'True',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                            // FALSE BUTTON
                            height: 100,
                            color: Colors.red,
                            onPressed: () {
                              print('pressed');
                            },
                            child: const Text(
                              'False',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  // SCORE CHECKS BAR
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: scoreKeeper,
                  ),
                ),
                Container(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but upstairs', false,
question2:question 2, true,
question3, question 3, true,

 */
