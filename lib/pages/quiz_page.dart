import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quick_quiz/data/colors.dart';
import 'package:quick_quiz/data/notifiers.dart';
import 'package:quick_quiz/data/styles.dart';
import 'package:quick_quiz/pages/complete_page.dart';
import 'package:quick_quiz/widgets/app_bar_actions.dart';
import 'package:quick_quiz/widgets/modal_widget.dart';
import 'package:quick_quiz/widgets/quiz_page_button_widget.dart';
import 'package:quick_quiz/widgets/two_child_expanded_widget.dart';
import 'package:quick_quiz/widgets/variant_widget.dart';

class QuizQuestion {
  late String question;
  late String image;
  late List<String> variants;
  late int answerId;
  QuizQuestion({
    required this.question,
    required this.image,
    required this.variants,
    required this.answerId,
  });
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.questionId});
  final int questionId;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late int leastSeconds;
  late Timer timer;
  int correctAnswers = 0;

  void toEnd() {
    Timer(Duration(seconds: 2), () {
      for (int i = 0; i < quizes.value.length; i++) {
        if (answers.value[i] ==
            quizes.value[i].answerId - 1) {
          correctAnswers++;
        }
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CompletePage(
            correctAnswers: correctAnswers,
            questionCount: quizes.value.length,
          ),
        ),
      );
      isClicked.value = false;
      selectedVariantNotifier.value = -1;
    });
  }

  void nextQuestion() {
    Timer(Duration(seconds: 2), () {
      currentQuestionNotifier.value++;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizPage(
            questionId: currentQuestionNotifier.value,
          ),
        ),
      );
      isClicked.value = false;
      selectedVariantNotifier.value = -1;
    });
  }

  void closeQuiz() {
    timer.cancel();
    showDialog(
      context: context,
      builder: (context) => ModalWidget(),
    ).whenComplete(() {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          leastSeconds--;
          if (leastSeconds == 0) {
            timer.cancel();
            if (currentQuestionNotifier.value ==
                quizes.value.length) {
              toEnd();
            } else {
              nextQuestion();
            }
          }
        });
      });
    });
  }

  @override
  void initState() {
    leastSeconds = 30;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        leastSeconds--;
        if (leastSeconds == 0) {
          timer.cancel();
          if (currentQuestionNotifier.value ==
              quizes.value.length) {
            toEnd();
          } else {
            nextQuestion();
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<VariantWidget> items = List.generate(
      quizes.value[widget.questionId - 1].variants.length,
      (index) => VariantWidget(
        title: quizes
            .value[widget.questionId - 1]
            .variants[index],
        id: index,
        answerId:
            quizes.value[widget.questionId - 1].answerId,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(
          horizontal: 22,
        ),
        actions: appBarActions,
        leading: CloseButton(
          onPressed: () => closeQuiz(),
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              Color(QuizColors.white),
            ),
          ),
        ),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(QuizColors.purple1),

            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            leastSeconds.toString(),
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontVariations: [FontVariation.weight(600)],
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: TwoChildExpandedWidget(
        firstChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              quizes.value[widget.questionId - 1].question,
              textAlign: TextAlign.center,
              style: KTextStyle.title2,
            ),
            Image.asset(
              quizes.value[widget.questionId - 1].image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ...items,
          ],
        ),
        secondChild: QuizPageButtonWidget(
          timer: timer,
          nextQuestion: nextQuestion,
          toEnd: toEnd,
        ),
      ),
    );
  }
}
