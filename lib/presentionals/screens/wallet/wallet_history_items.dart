import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import '../../presentionals_index.dart';

class WalletHistoryItems extends StatefulWidget {
  const WalletHistoryItems({super.key});

  @override
  State<WalletHistoryItems> createState() => _WalletHistoryItemsState();
}

class _WalletHistoryItemsState extends State<WalletHistoryItems> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Transaction History'),
            const AppVerticalPadding(),
            Expanded(
              child: StreamBuilder<UserInfoModel>(
                stream: GlobalBloc.userDataProvider.observerUserInfo(),
                builder: (context, snapshot) {
                  final transactions = snapshot.data?.transactions ?? [];
                  return AppHistoryChargesAndOrders(
                    historyModel: transactions
                        .map((e) => HistoryTileUIModel(
                              name: e.name,
                              date: e.dateChange,
                              imageUrl: e.imageUrl,
                              type: e.isIncrease
                                  ? HistoryTileUIType.topup
                                  : HistoryTileUIType.order,
                              moneyValue: e.amount,
                            ))
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
