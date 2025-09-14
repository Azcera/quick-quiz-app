import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/styles.dart';
import 'package:quick_quiz/pages/welcome_page.dart';
import 'package:quick_quiz/widgets/main_button_widget.dart';
import 'package:share_plus/share_plus.dart';

class CompletePage extends StatelessWidget {
  const CompletePage({
    super.key,
    required this.correctAnswers,
    required this.questionCount,
  });
  final int correctAnswers;
  final int questionCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 35.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/congrats face.png',
                  ),
                  SizedBox(height: 56),
                  RichText(
                    text: TextSpan(
                      style: KTextStyle.title1,
                      children: [
                        TextSpan(
                          text: 'Quick',
                          style: TextStyle(
                            color: Color(
                              QuizColors.purple1,
                            ),
                          ),
                        ),
                        TextSpan(text: 'Quiz Complete!'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Align(
                    child: Text(
                      'Awesome job completing a QuikQuiz. Your results are zooming their way to your inbox. Sharing is caring, don\'t forget to show off your knowledge to friends and fam!',
                      style: KTextStyle.plain,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  MainButtonWidget(
                    title: 'Start Over 👊',
                    onPressed: () =>
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WelcomePage(),
                          ),
                        ),
                  ),
                  MainButtonWidget(
                    title: 'Share My Results 📣',
                    type: 'elevated',
                    onPressed: () => SharePlus.instance.share(
                      ShareParams(
                        title:
                            'Check Out My Results! I have $correctAnswers of $questionCount right answers!',
                        uri: Uri.parse(
                          'https://t.me/iazcera',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
