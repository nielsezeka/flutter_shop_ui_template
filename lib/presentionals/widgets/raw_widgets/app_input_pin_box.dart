import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';

class AppInputPINBox extends StatefulWidget {
  const AppInputPINBox({
    super.key,
    required this.inputLabel,
    required this.isTyping,
  });
  final String inputLabel;
  final bool isTyping;
  @override
  State<AppInputPINBox> createState() => _AppInputPINBoxState();
}

class _AppInputPINBoxState extends State<AppInputPINBox> {
  bool isWhite = false;
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 300), (Timer timer) {
      setState(() {
        isWhite = !isWhite;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: IgnorePointer(
        ignoring: false,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: AppStyleConfiguration.paddingSpacer,
          ),
          child: Container(
            height: AppStyleConfiguration.itemDefaultHeight,
            decoration: BoxDecoration(
              color: widget.isTyping
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(
                AppStyleConfiguration.itemNormalRadius,
              ),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      widget.inputLabel,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    right: 15,
                    child: widget.isTyping
                        ? AnimatedContainer(
                            duration: CustomTheme.animationDuration,
                            color: isWhite
                                ? Colors.white
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                            width: double.infinity,
                            height: 3,
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
