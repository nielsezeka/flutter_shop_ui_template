import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

import '../../../presentionals_index.dart';

class PaymentAdding extends StatefulWidget {
  const PaymentAdding({super.key});

  @override
  State<PaymentAdding> createState() => _PaymentAddingState();
}

class _PaymentAddingState extends State<PaymentAdding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Add Payment Method'),
            Expanded(
              child: SingleChildScrollView(
                child: AppHorizontalPaddingChild(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppCustomCreditCardDisplay(
                        isShowTopUp: false,
                      ),
                      const AppVerticalPadding(),
                      Text(
                        'Card Name',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      const AppInputField(hintText: 'Your Card Name'),
                      const AppVerticalPadding(),
                      Text(
                        'Card Number',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      const AppInputField(hintText: 'Your Card Number'),
                      const AppVerticalPadding(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Expiry Date',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const AppVerticalPadding(),
                                const AppInputField(hintText: 'Expiry Date'),
                                const AppVerticalPadding(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: AppStyleConfiguration.paddingSpacer,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'CVV',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const AppVerticalPadding(),
                                const AppInputField(hintText: 'Your CVV'),
                                const AppVerticalPadding(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const AppVerticalPadding(),
            AppButton(
                tittle: 'Add',
                onPresssed: () {
                  Navigator.of(context).pop();
                }),
            const AppVerticalPadding(),
          ],
        ),
      ),
    );
  }
}
