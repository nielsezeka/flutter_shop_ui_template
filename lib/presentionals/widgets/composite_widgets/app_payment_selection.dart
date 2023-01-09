import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax/iconsax.dart';

class PaymentMethodUI {
  final String paymentProvider;
  final String icon;

  PaymentMethodUI({required this.paymentProvider, required this.icon});
  static List<PaymentMethodUI> getPaymentDefault() {
    return [
      PaymentMethodUI(
        paymentProvider: 'My Wallet',
        icon: Logos.google_wallet,
      ),
      PaymentMethodUI(paymentProvider: 'Google Pay', icon: Logos.google),
      PaymentMethodUI(paymentProvider: 'Apple Pay', icon: Logos.apple_pay),
      PaymentMethodUI(paymentProvider: 'Visa', icon: Logos.visa),
    ].toList();
  }
}

class AppPaymentSelection extends StatefulWidget {
  const AppPaymentSelection({super.key});

  @override
  State<AppPaymentSelection> createState() => _AppPaymentSelectionState();
}

class _AppPaymentSelectionState extends State<AppPaymentSelection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: PaymentMethodUI.getPaymentDefault()
          .asMap()
          .map(
            (index, value) => MapEntry(
              index,
              Column(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => setState(() {
                      selectedIndex = index;
                    }),
                    child: Material(
                      color: Colors.transparent,
                      child: AppThreePartsButtons(
                        leading: Padding(
                          padding: EdgeInsets.only(
                            left: AppStyleConfiguration.paddingSpacer,
                          ),
                          child: Logo(value.icon),
                        ),
                        isUsedShadow: true,
                        center: Text(value.paymentProvider,
                            style: Theme.of(context).textTheme.bodyText1),
                        trailing: Padding(
                          padding: EdgeInsets.only(
                            right: AppStyleConfiguration.paddingSpacer,
                          ),
                          child: Icon(
                            Iconsax.tick_circle4,
                            color: (selectedIndex == index)
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const AppVerticalPadding(),
                ],
              ),
            ),
          )
          .values
          .whereType<Widget>()
          .toList(),
    );
  }
}
