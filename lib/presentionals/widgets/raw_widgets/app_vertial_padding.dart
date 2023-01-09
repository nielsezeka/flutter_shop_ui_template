import 'package:flutter/material.dart';

class AppVerticalPadding extends StatelessWidget {
  const AppVerticalPadding({super.key, this.size, this.multiplier});
  final double? size;
  final double? multiplier;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (size ?? 16.0) * (multiplier ?? 1.0),
    );
  }
}
