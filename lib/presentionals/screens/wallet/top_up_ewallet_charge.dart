import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import '../../presentionals_index.dart';

class TopupEWalletCharge extends StatefulWidget {
  const TopupEWalletCharge({super.key});

  @override
  State<TopupEWalletCharge> createState() => _TopupEWalletChargeState();
}

class _TopupEWalletChargeState extends State<TopupEWalletCharge> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppNavigationBar(tittle: 'Payment method'),
            const AppVerticalPadding(),
            Expanded(
              child: SingleChildScrollView(
                child: AppHorizontalPaddingChild(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Top Up method you to use',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const AppVerticalPadding(),
                      const AppPaymentSelection(),
                    ],
                  ),
                ),
              ),
            ),
            AppHorizontalPaddingChild(
              child: Column(
                children: [
                  Divider(
                    color: Theme.of(context).textTheme.bodyText1!.color,
                  ),
                  const AppVerticalPadding(),
                  AppButton(
                      tittle: 'Continue',
                      onPresssed: () => Navigator.of(context)
                          .pushNamed(ScreenRoute.topUpEnterPIN.name)),
                  const AppVerticalPadding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
