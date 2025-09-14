import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';
import 'package:quick_quiz/data/quizes.dart';
import 'package:quick_quiz/data/styles.dart';
import 'package:quick_quiz/pages/quiz_page.dart';
import 'package:quick_quiz/widgets/main_button_widget.dart';
import 'package:quick_quiz/widgets/two_child_expanded_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      FlutterNativeSplash.remove();
    });
    return Scaffold(
      appBar: AppBar(),
      body: TwoChildExpandedWidget(
        firstChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/nerd face.png'),
            SizedBox(height: 56),
            RichText(
              text: TextSpan(
                style: KTextStyle.title1,
                children: [
                  TextSpan(text: 'Ready for a '),
                  TextSpan(
                    text: 'Quick',
                    style: TextStyle(
                      color: Color(QuizColors.purple1),
                    ),
                  ),
                  TextSpan(text: 'Quiz?'),
                ],
              ),
            ),
            SizedBox(height: 5),
            Align(
              child: Text(
                'Gear up for a QuikQuiz sprint! You\'ve got just 30 seconds per question. Tap the info icon ℹ️ at the top right to check out the module each question comes from. Let\'s see what you\'ve got! - Goodluck!',
                style: KTextStyle.plain,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        secondChild: MainButtonWidget(
          title: 'Start A New Quiz ✏️',
          onPressed: () {
            currentQuestionNotifier.value = 1;
            answers.value = [-1, -1, -1];
            var rnd = Random();
            quizes.value =
                quizList[rnd.nextInt(quizList.length)];
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    QuizPage(questionId: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
