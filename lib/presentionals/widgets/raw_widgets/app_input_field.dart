import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:rxdart/rxdart.dart';
import '../app_item_style_configuration.dart';

class AppInputField extends StatefulWidget {
  const AppInputField({
    super.key,
    required this.hintText,
    this.leading,
    this.isSecured,
    this.trailing,
    this.onTextChanged,
    this.defaultText,
  });
  final String hintText;
  final IconData? leading;
  final Widget? trailing;
  final bool? isSecured;
  final String? defaultText;
  final ValueChanged<String>? onTextChanged;
  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  final double defaulInputField = AppStyleConfiguration.itemDefaultHeight;
  final AppInputFieldBloc _appInputFieldBloc = AppInputFieldBloc();
  late FocusNode _focusNode;
  final TextEditingController _textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      _appInputFieldBloc.accept(_focusNode.hasFocus);
    });
    if (widget.defaultText != null) {
      _textController.text = widget.defaultText!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDisableLeadingIcon = (widget.leading == null);
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
        SizedBox(
          height: defaulInputField,
          child: AppHorizontalPaddingChild(
            child: Row(
              children: [
                isDisableLeadingIcon
                    ? Container()
                    : StreamBuilder<bool>(
                        stream: _appInputFieldBloc.isTextFieldEdittingStream,
                        builder: (context, snapshot) {
                          final isTyping = snapshot.data ?? false;
                          return Icon(
                            widget.leading,
                            color: isTyping
                                ? Theme.of(context).primaryColor
                                : Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.5),
                          );
                        },
                      ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    onChanged: (value) {
                      if (widget.onTextChanged != null) {
                        widget.onTextChanged!(value);
                      }
                    },
                    obscureText: widget.isSecured ?? false,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 5,
                        right: 5,
                      ),
                      hintText: widget.hintText,
                    ),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                widget.trailing ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppInputFieldBloc {
  BehaviorSubject<bool> isTextFieldEdittingStream =
      BehaviorSubject<bool>.seeded(false);
  accept(bool isFocus) {
    if (isTextFieldEdittingStream.value != isFocus) {
      isTextFieldEdittingStream.add(isFocus);
    }
  }
}
