import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/theme_index.dart';
import 'order_screen_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderScreenBloc orderScreenBloc = OrderScreenBloc();

  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(
              tittle: 'Your Order',
              useIconInsteadBackButton: true,
            ),
            Expanded(
              child: Column(
                children: [
                  AppTabSelected(
                    items: const [
                      'Active',
                      'Completed',
                    ],
                    onTabSelected: (index) {
                      _controller.animateToPage(
                        index,
                        duration: CustomTheme.animationDuration,
                        curve: Curves.linear,
                      );
                    },
                  ),
                  const AppVerticalPadding(),
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      children: [
                        StreamBuilder<List<OrderItemUIModel>>(
                            stream:
                                GlobalBloc.orderDataBloc.observerOngoingOrder(),
                            builder: (context, snapshot) {
                              List<OrderItemUIModel> orders =
                                  snapshot.data ?? [];
                              return orders.isEmpty
                                  ? _renderEmptyData()
                                  : _renderOngoingOrderList(
                                      orders, OrderTileType.inDelivery);
                            }),
                        StreamBuilder<List<OrderItemUIModel>>(
                            stream: GlobalBloc.orderDataBloc
                                .observerCompletedOrder(),
                            builder: (context, snapshot) {
                              List<OrderItemUIModel> orders =
                                  snapshot.data ?? [];
                              return orders.isEmpty
                                  ? _renderEmptyData()
                                  : _renderOngoingOrderList(
                                      orders, OrderTileType.completed);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderEmptyData() {
    return const AppEmptyData(
      tittle: "You dont't have any order yet",
      description1: "You dont't have any order of this time",
      description2: '',
    );
  }

  _renderOngoingOrderList(List<OrderItemUIModel> orders, OrderTileType type) {
    return AppHorizontalPaddingChild(
      child: ListView.builder(
        itemBuilder: ((context, index) => Column(
              children: [
                AppOrderTile(
                  uiInfo: orders[index],
                  tileType: type,
                ),
                const AppVerticalPadding(),
              ],
            )),
        itemCount: orders.length,
      ),
    );
  }
}
