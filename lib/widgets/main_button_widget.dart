import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.type,
    this.color,
  });

  final void Function()? onPressed;
  final String title;
  final String? type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget text = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(QuizColors.white),
            fontVariations: [FontVariation.weight(700)],
            fontSize: 17,
          ),
        ),
      ],
    );
    return type == 'elevated'
        ? TextButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              overlayColor: Colors.transparent,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),

            onPressed: isClicked.value ? () {} : onPressed,
            child: text,
          )
        : FilledButton(
            style: FilledButton.styleFrom(
              disabledBackgroundColor: Color(
                QuizColors.grey1,
              ),
              padding: EdgeInsets.symmetric(vertical: 16),
              backgroundColor: color != null
                  ? color
                  : Color(QuizColors.purple1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.all(
                  Radius.circular(18),
                ),
              ),
              shadowColor: Colors.black,
              elevation: 4,
            ),
            onPressed: isClicked.value ? () {} : onPressed,
            child: text,
          );
  }
}
