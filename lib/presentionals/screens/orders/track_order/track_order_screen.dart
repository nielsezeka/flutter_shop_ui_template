import 'package:flutter/material.dart';
import '../../../../bloc/global_bloc.dart';
import '../../../presentionals_index.dart';
import '../order_screen_bloc.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({
    super.key,
  });
  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              const AppNavigationBar(tittle: 'Track order'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<OrderItemUIModel?>(
                          stream: GlobalBloc.orderDataBloc.observerFocusOrder(),
                          builder: (context, snapshot) {
                            OrderItemUIModel? order = snapshot.data;
                            if (order != null) {
                              return Column(
                                children: [
                                  AppCartItem(
                                    enableDeleteButton: false,
                                    enablePlusAndMinusButtons: false,
                                    uiInfo: CartItemUIModel.fromOrder(order),
                                    onDelete: (id) {},
                                  ),
                                  const AppVerticalPadding(),
                                ],
                              );
                            }
                            return Container();
                          }),
                      AppTrackingBar(
                        tracks: GetStatus.getTrack(),
                        currentTrackingStatus: TrackingStatus.shopPackaging,
                      ),
                      const AppVerticalPadding(),
                      Divider(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      const AppVerticalPadding(),
                      Text(
                        'Order status detail',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      StreamBuilder<OrderItemUIModel?>(
                          stream: GlobalBloc.orderDataBloc.observerFocusOrder(),
                          builder: (context, snapshot) {
                            OrderItemUIModel? order = snapshot.data;
                            if (order != null) {
                              return Column(
                                children: order.histories
                                    .map((e) => AppTrackOrderTile())
                                    .toList(),
                              );
                            }
                            return Container();
                          }),
                    ],
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
