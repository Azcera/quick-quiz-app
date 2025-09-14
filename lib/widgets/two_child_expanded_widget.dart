import 'package:flutter/material.dart';

class TwoChildExpandedWidget extends StatelessWidget {
  const TwoChildExpandedWidget({
    super.key,
    required this.firstChild,
    required this.secondChild,
  });
  final Widget firstChild;
  final Widget secondChild;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22.0,
        right: 22.0,
        top: 10.0,
        bottom: 35.0,
      ),
      child: Column(
        children: [
          Expanded(flex: 9, child: firstChild),
          Expanded(child: SizedBox()),
          Expanded(child: secondChild),
        ],
      ),
    );
  }
}
