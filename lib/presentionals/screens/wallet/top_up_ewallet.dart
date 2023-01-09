import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';

class TopupEWallet extends StatefulWidget {
  const TopupEWallet({super.key});

  @override
  State<TopupEWallet> createState() => _TopupEWalletState();
}

class _TopupEWalletState extends State<TopupEWallet> {
  final List<int> predefineMoneyValues = [
    10,
    20,
    50,
    100,
    200,
    250,
    500,
    750,
    1000
  ];

  int inputPredefineMoney = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              const AppNavigationBar(tittle: 'Top Up E-Wallet'),
              const AppVerticalPadding(),
              Expanded(
                child: Scaffold(
                  backgroundColor: Theme.of(context).backgroundColor,
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Enter amount of Top Up',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const AppVerticalPadding(),
                        Container(
                          width: double.infinity,
                          height: AppStyleConfiguration.itemDefaultHeight * 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              AppStyleConfiguration.itemNormalRadius,
                            ),
                          ),
                          child: AppInputFieldTopup(
                            hintText: '',
                            predefineValue: inputPredefineMoney,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 200,
                            minHeight: 200,
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      AppStyleConfiguration.paddingSpacer),
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    setState(() {
                                      inputPredefineMoney =
                                          predefineMoneyValues[index];
                                    });
                                  },
                                  child: Text(
                                    '\$ ${predefineMoneyValues[index]}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                            ),
                            itemCount: predefineMoneyValues.length,
                          ),
                        ),
                        AppButton(
                          tittle: 'Continue',
                          onPresssed: () => Navigator.of(context).pushNamed(
                            ScreenRoute.topupEWalletCharge.name,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
