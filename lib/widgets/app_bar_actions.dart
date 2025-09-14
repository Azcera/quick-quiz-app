import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';

List<Widget> appBarActions = [
  ValueListenableBuilder(
    valueListenable: currentQuestionNotifier,
    builder: (context, value, child) => Row(
      children: [
        SizedBox(width: 5),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              letterSpacing: 1.2,
              fontVariations: [FontVariation.weight(600)],
              fontSize: 14,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 18,
                      color: Color(QuizColors.grey1),
                      applyTextScaling: true,
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),

              TextSpan(
                text: currentQuestionNotifier.value
                    .toString(),
              ),
              TextSpan(
                text: ' / ${quizes.value.length}',
                style: TextStyle(
                  color: Color(QuizColors.grey1),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
];
