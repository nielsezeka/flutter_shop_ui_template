import 'package:flutter/material.dart';

class VerticalSliderWithText extends StatelessWidget {
  const VerticalSliderWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: Container(
              width: double.infinity,
              height: 1,
              color: Theme.of(context).disabledColor,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Container(
              color: Theme.of(context).backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'or continue with',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
