import 'package:flutter/material.dart';

class CustomRouteWidget<T> extends MaterialPageRoute<T> {
  CustomRouteWidget({required this.builder})
    : super(builder: builder);

  final WidgetBuilder builder;
  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return FadeTransition(opacity: animation, child: child);
  }
}
