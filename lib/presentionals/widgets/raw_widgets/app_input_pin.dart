import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rxdart/rxdart.dart';
import '../../presentionals_index.dart';
import '../app_item_style_configuration.dart';

class AppInputPin extends StatefulWidget {
  const AppInputPin({super.key});

  @override
  State<AppInputPin> createState() => _AppInputPinState();
}

class _AppInputPinState extends State<AppInputPin> {
  final TopUpPINInputBloc _topUpPINInputBloc = TopUpPINInputBloc();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          const AppVerticalPadding(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppStyleConfiguration.paddingSpacer,
            ),
            child: StreamBuilder<List<InputState>>(
                stream: _topUpPINInputBloc.observerInputs(),
                builder: (context, snapshot) {
                  List<InputState> inputs = snapshot.data ?? [];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: inputs
                        .asMap()
                        .map(
                          (index, element) => MapEntry(
                            index,
                            AppInputPINBox(
                              isTyping: index ==
                                  _topUpPINInputBloc.getFirstEmptyBox(),
                              inputLabel: element.singlePINValue,
                            ),
                          ),
                        )
                        .values
                        .toList(),
                  );
                }),
          ),
          const AppVerticalPadding(),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(
                AppStyleConfiguration.paddingSpacer,
              ),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                mainAxisSpacing: AppStyleConfiguration.paddingSpacer,
                crossAxisSpacing: AppStyleConfiguration.paddingSpacer,
              ),
              itemBuilder: (context, index) =>
                  _createButton(TopUpPINInputBloc.buttons[index]),
              itemCount: TopUpPINInputBloc.buttons.length,
            ),
          ),
          const AppVerticalPadding(),
        ],
      ),
    );
  }

  Widget _createButton(String name) {
    if (int.tryParse(name) != null) {
      final label = int.tryParse(name)?.toString() ?? '';
      return AppButton(
        tittle: label,
        onPresssed: () {
          _topUpPINInputBloc.acceptInputBox(
            pinValue: label,
            currentlyInbox: _topUpPINInputBloc.getFirstEmptyBox(),
          );
        },
      );
    }
    if (name.isNotEmpty) {
      return AppButton(
        leadingIcon: const Icon(
          Bootstrap.backspace,
          color: Colors.white,
        ),
        tittle: '',
        onPresssed: () {
          _topUpPINInputBloc.deleteTextFieldValue();
        },
      );
    }
    return Container();
  }
}

class InputState {
  final bool isCurrentlyFocus;
  final int index;
  final String singlePINValue;
  InputState copyWith({
    bool? isCurrentlyFocus,
    required String singlePINValue,
  }) {
    return InputState(
      index: index,
      isCurrentlyFocus: isCurrentlyFocus ?? false,
      singlePINValue: singlePINValue,
    );
  }

  InputState({
    required this.isCurrentlyFocus,
    required this.index,
    required this.singlePINValue,
  });
}

class TopUpPINInputBloc {
  static final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'back',
  ];
  final BehaviorSubject<List<InputState>> _inputsStream =
      BehaviorSubject<List<InputState>>.seeded(
    [
      InputState(isCurrentlyFocus: true, index: 0, singlePINValue: ''),
      InputState(isCurrentlyFocus: true, index: 1, singlePINValue: ''),
      InputState(isCurrentlyFocus: true, index: 2, singlePINValue: ''),
      InputState(isCurrentlyFocus: true, index: 3, singlePINValue: ''),
    ],
  );
  observerInputs() {
    return _inputsStream;
  }

  int getFirstEmptyBox() {
    return _inputsStream.value
            .firstWhereOrNull((element) => element.singlePINValue.isEmpty)
            ?.index ??
        -1;
  }

  observerFirstEmptyBox() {
    return _inputsStream.switchMap((value) => Stream.value(value
            .firstWhereOrNull((element) => element.singlePINValue.isEmpty)
            ?.index ??
        -1));
  }

  acceptInputBox({
    required String pinValue,
    required int currentlyInbox,
  }) {
    _inputsStream.add(_inputsStream.value
        .map((e) {
          return e.copyWith(
            singlePINValue: currentlyInbox == e.index
                ? pinValue.toString()
                : e.singlePINValue,
          );
        })
        .toList()
        .map(
          (e) => e.copyWith(
            isCurrentlyFocus: e.singlePINValue.isNotEmpty,
            singlePINValue: e.singlePINValue,
          ),
        )
        .toList());
  }

  deleteTextFieldValue() {
    final lastItemForDelete = (getFirstEmptyBox() != -1)
        ? getFirstEmptyBox()
        : _inputsStream.value.length;
    _inputsStream.add(_inputsStream.value
        .map(
          (e) => e.copyWith(
            singlePINValue:
                (lastItemForDelete - 1) == e.index ? '' : e.singlePINValue,
          ),
        )
        .whereType<InputState>()
        .toList());
  }

  void dispose() {
    _inputsStream.close();
  }
}
