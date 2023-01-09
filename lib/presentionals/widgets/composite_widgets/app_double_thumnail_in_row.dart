import 'package:flutter/material.dart';

import '../../presentionals_index.dart';
import '../app_item_style_configuration.dart';

class AppDoubleThumnailInRow extends StatelessWidget {
  const AppDoubleThumnailInRow({
    super.key,
    required this.leftItem,
    required this.rightItem,
  });
  final ProductUIModel leftItem;
  final ProductUIModel? rightItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppThumnailItem(
            uiInfo: leftItem,
            height: 250,
          ),
        ),
        Padding(
            padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer / 2)),
        Expanded(
          child: _renderRightItemIfNeeded(),
        ),
      ],
    );
  }

  Widget _renderRightItemIfNeeded() {
    if (rightItem == null) return Container();
    return AppThumnailItem(
      uiInfo: rightItem!,
      height: 250,
    );
  }
}
