import 'package:flutter/material.dart';

class AppHorizontalPaddingChild extends StatelessWidget {
  const AppHorizontalPaddingChild({super.key, this.size, required this.child});
  final double? size;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size ?? 8.0),
      child: child,
    );
  }
}
