import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';
import 'package:quick_quiz/pages/welcome_page.dart';
import 'package:quick_quiz/widgets/main_button_widget.dart';

class ModalWidget extends StatelessWidget {
  const ModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Sure You Want To Quit?',
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.only(
        top: 10.0,
        bottom: 25.0,
      ),
      content: Text(
        'If you leave now you\'ll lose your progress',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontVariations: [FontVariation.weight(500)],
        ),
      ),
      actions: [
        Column(
          children: [
            MainButtonWidget(
              title: 'Quit Quiz 💀',
              color: Color(QuizColors.red1),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                  ModalRoute.withName(''),
                );
                selectedVariantNotifier.value = -1;
                currentQuestionNotifier.value = 1;
              },
            ),
            MainButtonWidget(
              type: 'elevated',
              title: 'Continue Quiz 👊',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
