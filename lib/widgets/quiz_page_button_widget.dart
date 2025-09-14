import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_quiz/data/notifiers.dart';
import 'package:quick_quiz/widgets/main_button_widget.dart';

class QuizPageButtonWidget extends StatelessWidget {
  const QuizPageButtonWidget({
    super.key,
    required this.timer,
    required this.nextQuestion,
    required this.toEnd,
  });

  final Timer timer;
  final Function() toEnd;
  final Function() nextQuestion;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedVariantNotifier,
      builder: (context, value, child) =>
          ValueListenableBuilder(
            valueListenable: isClicked,
            builder: (context, value, child) =>
                MainButtonWidget(
                  title: 'Lock It In 🔓',
                  onPressed:
                      selectedVariantNotifier.value >= 0
                      ? !isClicked.value
                            ? () {
                                isClicked.value = true;
                                timer.cancel();
                                if (currentQuestionNotifier
                                        .value <
                                    quizes.value.length) {
                                  nextQuestion();
                                } else {
                                  toEnd();
                                }
                              }
                            : () {}
                      : null,
                ),
          ),
    );
  }
}
