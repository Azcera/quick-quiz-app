import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';

class VariantWidget extends StatefulWidget {
  const VariantWidget({
    super.key,
    required this.title,
    required this.id,
    required this.answerId,
  });

  final String title;
  final int id;
  final int answerId;
  @override
  State<VariantWidget> createState() =>
      _VariantWidgetState();
}

bool isChecked = false;

class _VariantWidgetState extends State<VariantWidget> {
  @override
  void initState() {
    if (widget.id == selectedVariantNotifier.value) {
      isChecked = true;
    } else {
      isChecked = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedVariantNotifier,
      builder: (context, value, child) =>
          ValueListenableBuilder(
            valueListenable: isClicked,
            builder: (context, value, child) =>
                CheckboxListTile(
                  title: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontVariations: [
                        FontVariation.weight(700),
                      ],
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  tileColor: isClicked.value
                      ? (widget.id == widget.answerId - 1
                            ? Color(QuizColors.green2)
                            : selectedVariantNotifier
                                      .value ==
                                  widget.id
                            ? Color(QuizColors.red2)
                            : Color(QuizColors.purple2))
                      : Color(QuizColors.purple2),
                  activeColor: isClicked.value
                      ? (widget.id == widget.answerId - 1
                            ? Color(QuizColors.green1)
                            : selectedVariantNotifier
                                      .value ==
                                  widget.id
                            ? Color(QuizColors.red1)
                            : Color(QuizColors.purple4))
                      : (widget.id ==
                                selectedVariantNotifier
                                    .value
                            ? Color(QuizColors.purple1)
                            : Color(QuizColors.purple4)),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isClicked.value
                          ? (widget.id ==
                                    widget.answerId - 1
                                ? Color(QuizColors.green1)
                                : selectedVariantNotifier
                                          .value ==
                                      widget.id
                                ? Color(QuizColors.red1)
                                : Color(QuizColors.purple4))
                          : (widget.id ==
                                    selectedVariantNotifier
                                        .value
                                ? Color(QuizColors.purple1)
                                : Color(
                                    QuizColors.purple4,
                                  )),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  checkboxShape: RoundedRectangleBorder(
                    side: BorderSide(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  value:
                      widget.id ==
                      selectedVariantNotifier.value,
                  onChanged: (value) {
                    setState(() {
                      selectedVariantNotifier.value =
                          widget.id;
                      answers.value[currentQuestionNotifier
                                  .value -
                              1] =
                          widget.id;
                    });
                  },
                ),
          ),
    );
  }
}
