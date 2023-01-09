import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import '../../presentionals_index.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const AppNavigationBar(
                tittle: 'Your Wallet',
                useIconInsteadBackButton: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: AppHorizontalPaddingChild(
                    child: Column(children: [
                      const AppCustomCreditCardDisplay(),
                      AppSectionLabelWithChild(
                        tittle: 'Transaction history',
                        child: StreamBuilder<UserInfoModel>(
                            stream:
                                GlobalBloc.userDataProvider.observerUserInfo(),
                            builder: (context, snapshot) {
                              final transactions =
                                  snapshot.data?.transactions ?? [];
                              return AppHistoryChargesAndOrders(
                                historyModel: transactions
                                    .map(
                                      (e) => HistoryTileUIModel(
                                        name: e.name,
                                        date: e.dateChange,
                                        imageUrl: e.imageUrl,
                                        type: e.isIncrease
                                            ? HistoryTileUIType.topup
                                            : HistoryTileUIType.order,
                                        moneyValue: e.amount,
                                      ),
                                    )
                                    .toList(),
                              );
                            }),
                        onSelectAll: () {
                          Navigator.of(context).pushNamed(
                            ScreenRoute.walletHistory.name,
                          );
                        },
                      ),
                    ]),
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
