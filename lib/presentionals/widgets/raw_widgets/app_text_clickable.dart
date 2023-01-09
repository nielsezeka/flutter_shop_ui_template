import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextClickable extends StatelessWidget {
  const AppTextClickable({
    super.key,
    required this.tittle,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 1,
      padding: EdgeInsets.zero,
      onPressed: () => onPressed(),
      child: Material(
        color: Colors.transparent,
        child: Text(
          tittle,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
