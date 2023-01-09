import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';
import '../app_item_style_configuration.dart';

/// A button style for application
///
/// The [isCollapsed] control how button represent, if true or null, the button
/// will expand all the width of screen. Otherwise it will fit with the text
///
/// The [buttonStyle] control how button display,
/// We support 2 types of button: full color of primary or just only the border
/// Default(pass null, or leave the param) it will full color
///
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    this.height,
    this.isCollapsed,
    this.buttonStyle,
    this.leadingIcon,
    required this.tittle,
    required this.onPresssed,
    this.isDisabled,
  });
  final double? height;
  final bool? isCollapsed;
  final String tittle;
  final Widget? leadingIcon;
  final AppButtonStyle? buttonStyle;
  final VoidCallback onPresssed;
  final bool? isDisabled;
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  final double defaultButtonHeight = AppStyleConfiguration.itemDefaultHeight;
  @override
  Widget build(BuildContext context) {
    final isButtonCollapsed = (widget.isCollapsed ?? false);
    final isFullColor =
        (widget.buttonStyle ?? AppButtonStyle.primaryColorBackground) ==
            AppButtonStyle.primaryColorBackground;

    final double buttonHeight = widget.height ?? defaultButtonHeight;
    final bool isDisableTouch = widget.isDisabled ?? false;
    return IgnorePointer(
      ignoring: isDisableTouch,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: CustomTheme.animationDuration,
            width: isButtonCollapsed ? null : double.infinity,
            padding: isButtonCollapsed
                ? EdgeInsets.symmetric(horizontal: buttonHeight / 2)
                : null,
            decoration: BoxDecoration(
              color: _getButtonColor(Theme.of(context)),
              borderRadius: BorderRadius.circular(buttonHeight / 2),
              border: Border.all(
                  color: isFullColor
                      ? Colors.transparent
                      : Theme.of(context).primaryColor),
            ),
            height: buttonHeight,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _renderIconIfNeeded(),
                  Text(
                    widget.tittle,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          color: isFullColor
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onPressed: () {
          widget.onPresssed();
        },
      ),
    );
  }

  Color? _getButtonColor(ThemeData theme) {
    if (widget.isDisabled ?? false) {
      return theme.primaryColor.withOpacity(0.5);
    }
    final isFullColor =
        (widget.buttonStyle ?? AppButtonStyle.primaryColorBackground) ==
            AppButtonStyle.primaryColorBackground;
    return isFullColor ? Theme.of(context).primaryColor : null;
  }

  Widget _renderIconIfNeeded() {
    if (widget.leadingIcon != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: widget.leadingIcon,
      );
    }
    return Container();
  }
}

enum AppButtonStyle {
  primaryColorBackground,
  primariColorBorderOnly,
}
