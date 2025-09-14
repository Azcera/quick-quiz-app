import 'package:flutter/widgets.dart';

class KTextStyle {
  static const title1 = TextStyle(
    fontFamily: 'Satoshi',
    fontSize: 33,
    fontVariations: [FontVariation.weight(800)],
  );
  static const plain = TextStyle(
    fontVariations: [FontVariation.weight(300)],
    fontSize: 15,
    height: 1.9,
  );
  static const title2 = TextStyle(
    fontSize: 23,
    fontVariations: [FontVariation.weight(800)],
  );
}
