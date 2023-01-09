import 'package:flutter/material.dart';

class AppDotIndicator extends StatefulWidget {
  const AppDotIndicator(
      {super.key, required this.total, required this.currentSelected});
  final int total;
  final int currentSelected;
  @override
  State<AppDotIndicator> createState() => _AppDotIndicatorState();
}

class _AppDotIndicatorState extends State<AppDotIndicator> {
  final double baseHeight = 12;
  final double padding = 3;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: baseHeight,
      child: _renderDots(
        widget.total,
        widget.currentSelected,
      ),
    );
  }

  _renderDots(int total, int selectedIndex) {
    final items = List.generate(
      total,
      (index) => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular((baseHeight - padding * 2) / 2),
        ),
        width: index == selectedIndex ? 100 : (baseHeight - padding * 2),
        margin: EdgeInsets.all(padding),
      ),
    ).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }
}
