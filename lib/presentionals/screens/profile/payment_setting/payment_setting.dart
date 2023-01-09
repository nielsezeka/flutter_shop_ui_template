import 'package:flutter/material.dart';
import '../../../../routes/routes.dart';
import '../../../presentionals_index.dart';

class PaymentSetting extends StatefulWidget {
  const PaymentSetting({super.key});

  @override
  State<PaymentSetting> createState() => _PaymentSettingState();
}

class _PaymentSettingState extends State<PaymentSetting> {
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
                    children: const [
                      AppVerticalPadding(),
                      AppPaymentSelection(),
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
                    tittle: 'Add New Payment',
                    onPresssed: () => Navigator.of(context).pushNamed(
                      ScreenRoute.paymentAdding.name,
                    ),
                  ),
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
