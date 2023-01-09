import 'package:flutter/material.dart';
import '../raw_widgets/app_history_tile.dart';

class AppHistoryChargesAndOrders extends StatelessWidget {
  const AppHistoryChargesAndOrders({super.key, required this.historyModel});
  final List<HistoryTileUIModel> historyModel;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: historyModel
          .map(
            (e) => AppHistoryTile(
              uiInfo: e,
            ),
          )
          .toList(),
    );
  }
}
