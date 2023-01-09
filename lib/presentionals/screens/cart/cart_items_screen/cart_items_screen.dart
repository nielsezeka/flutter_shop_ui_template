import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import '../cart_items_screen_bloc.dart';

class CardItemScreen extends StatefulWidget {
  const CardItemScreen({super.key});

  @override
  State<CardItemScreen> createState() => _CardItemScreenState();
}

class _CardItemScreenState extends State<CardItemScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(
              tittle: 'Your Cart',
              useIconInsteadBackButton: true,
            ),
            Expanded(
              child: StreamBuilder<List<CartItemUIModel>>(
                  stream:
                      CartItemScreenBloc.cartItemScreenBloc.observerCartItem(),
                  builder: (context, snapshot) {
                    final isNotEmptyCart = snapshot.data?.isNotEmpty ?? false;
                    return AppHorizontalPaddingChild(
                      child: isNotEmptyCart
                          ? _renderList(snapshot.data!)
                          : _renderEmpty(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderEmpty() {
    return const AppEmptyData(
        tittle: 'Your cart is empty',
        description1: "You don't have any items added to cart yet",
        description2: '');
  }

  Widget _renderList(List<CartItemUIModel> items) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  AppCartItem(
                    uiInfo: items[index],
                    onDelete: (value) => CartItemScreenBloc.cartItemScreenBloc
                        .deleteItemInCard(value),
                  ),
                  const AppVerticalPadding(),
                ],
              ),
              itemCount: items.length,
            ),
          ),
          StreamBuilder<int>(
              stream:
                  CartItemScreenBloc.cartItemScreenBloc.observerTotalCount(),
              builder: (context, snapshot) {
                int value = snapshot.data ?? 0;
                return AppAddingProductBar(
                  buttonTittle: 'Check out',
                  onClick: () => Navigator.of(context).pushNamed(
                    ScreenRoute.checkout.name,
                  ),
                  totalCount: value,
                );
              }),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
