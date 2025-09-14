import 'package:flutter/material.dart';
import 'package:quick_quiz/pages/quiz_page.dart';

ValueNotifier<int> selectedVariantNotifier = ValueNotifier(
  -1,
);
ValueNotifier<int> currentQuestionNotifier = ValueNotifier(
  1,
);
ValueNotifier<bool> isClicked = ValueNotifier(false);
ValueNotifier<List<int>> answers = ValueNotifier([
  -1,
  -1,
  -1,
]);

ValueNotifier<List<QuizQuestion>> quizes = ValueNotifier(
  [],
);
