import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import '../app_item_style_configuration.dart';

class AppInputFieldTopup extends StatefulWidget {
  const AppInputFieldTopup({
    super.key,
    required this.hintText,
    required this.predefineValue,
  });
  final String hintText;
  final int predefineValue;
  @override
  State<AppInputFieldTopup> createState() => _AppInputFieldTopupState();
}

class _AppInputFieldTopupState extends State<AppInputFieldTopup> {
  final double defaulInputField = AppStyleConfiguration.itemDefaultHeight;
  final AppInputFieldTopupBloc _appInputFieldBloc = AppInputFieldTopupBloc();
  final TextEditingController _textEditingController = TextEditingController();
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _appInputFieldBloc.accept(_focusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(covariant AppInputFieldTopup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.predefineValue != widget.predefineValue) {
      _textEditingController.text = widget.predefineValue.toString();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<bool>(
            stream: _appInputFieldBloc.isTextFieldEdittingStream,
            builder: (context, snapshot) {
              final isTyping = snapshot.data ?? false;
              return Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: isTyping
                        ? Theme.of(context).focusColor
                        : Theme.of(context).disabledColor,
                    borderRadius: BorderRadius.circular(
                      AppStyleConfiguration.itemNormalRadius,
                    ),
                    border: isTyping
                        ? Border.all(color: Theme.of(context).primaryColor)
                        : null,
                  ),
                ),
              );
            }),
        SizedBox.expand(
          child: Center(
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: widget.hintText),
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

class AppInputFieldTopupBloc {
  BehaviorSubject<bool> isTextFieldEdittingStream =
      BehaviorSubject<bool>.seeded(false);
  accept(bool isFocus) {
    if (isTextFieldEdittingStream.value != isFocus) {
      isTextFieldEdittingStream.add(isFocus);
    }
  }
}
