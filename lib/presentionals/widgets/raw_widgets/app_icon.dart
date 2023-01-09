import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.size});
  final double? size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 50.0,
      height: size ?? 50.0,
      child: Image.asset(
        'assets/img/leaf.png',
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
