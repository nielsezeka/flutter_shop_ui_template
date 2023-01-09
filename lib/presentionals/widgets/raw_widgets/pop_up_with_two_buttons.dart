import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../presentionals_index.dart';
import '../app_item_style_configuration.dart';

class PopupWithTwoButtons extends StatefulWidget {
  const PopupWithTwoButtons({
    super.key,
    required this.tittle,
    required this.description,
    required this.firstButton,
    required this.secondButton,
    this.isShowLoading,
  });
  final String tittle;
  final String description;
  final String firstButton;
  final String secondButton;
  final bool? isShowLoading;
  @override
  State<PopupWithTwoButtons> createState() => _PopupWithTwoButtonsState();
}

class _PopupWithTwoButtonsState extends State<PopupWithTwoButtons> {
  @override
  Widget build(BuildContext context) {
    bool showLoading = widget.isShowLoading ?? false;
    return Material(
      color: Colors.transparent,
      child: AppHorizontalPaddingChild(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(
                AppStyleConfiguration.itemDefaultHeight / 2,
              ),
            ),
            padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer * 2),
            margin: EdgeInsets.all(AppStyleConfiguration.paddingSpacer * 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LineAwesome.angellist,
                  size: 150,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  widget.tittle,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                const AppVerticalPadding(),
                IndexedStack(
                  index: showLoading ? 1 : 0,
                  children: [
                    Column(
                      children: [
                        AppButton(
                          tittle: widget.firstButton,
                          onPresssed: () => Navigator.of(context).pop(),
                        ),
                        const AppVerticalPadding(),
                        AppButton(
                          tittle: widget.secondButton,
                          onPresssed: () => Navigator.of(context).pop(),
                          buttonStyle: AppButtonStyle.primariColorBorderOnly,
                        ),
                      ],
                    ),
                    const Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
