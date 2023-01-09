import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
                        'Select payment method to use',
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
                      tittle: 'Confirm Payment',
                      onPresssed: () => _showMyDialog()),
                  const AppVerticalPadding(),
                ],
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
            tittle: 'Order Successful',
            description: 'You have successfully made order',
            firstButton: 'View Order',
            secondButton: 'View E-Receipt');
      },
    );
  }
}
