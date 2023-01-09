import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';

class SetupPIN extends StatefulWidget {
  const SetupPIN({super.key});

  @override
  State<SetupPIN> createState() => _SetupPINState();
}

class _SetupPINState extends State<SetupPIN> {
  final TopUpPINInputBloc _topUpPINInputBloc = TopUpPINInputBloc();
  @override
  void dispose() {
    super.dispose();
    _topUpPINInputBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Enter your PIN'),
            const AppVerticalPadding(
              multiplier: 2,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AppHorizontalPaddingChild(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Enter your PIN to confirm top up',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const AppVerticalPadding(),
                      const AppInputPin(),
                      const AppVerticalPadding(),
                      AppButton(
                        tittle: 'Continue',
                        onPresssed: () {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                ScreenRoute.mainTabbar.name,
                                (Route<dynamic> route) => false);
                          });
                          _showMyDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return const PopupWithTwoButtons(
          tittle: 'Congratulations',
          description:
              'Your account is ready to use. You we redirect to the Home page in a few seconds',
          firstButton: '',
          secondButton: '',
          isShowLoading: true,
        );
      },
    );
  }
}
