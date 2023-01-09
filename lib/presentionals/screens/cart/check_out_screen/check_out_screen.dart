import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';
import '../cart_items_screen_bloc.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    super.initState();
    GlobalBloc.shippingAndPromoProvider
        .reloadPromoCodeFromServer('any_id_you_need');
    GlobalBloc.shippingAndPromoProvider
        .reloadShippingTypeFromServer('any_id_you_need');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AppHorizontalPaddingChild(
        child: SafeArea(
          child: Column(
            children: [
              const AppNavigationBar(tittle: 'Checkout'),
              const AppVerticalPadding(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping address',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(ScreenRoute.addressPick.name),
                        child: Material(
                          color: Colors.transparent,
                          child: StreamBuilder<AddressForCartItemModel>(
                              stream: GlobalBloc.cartProvider
                                  .observerAddressForCart(),
                              builder: (context, snapshot) {
                                final String address = snapshot
                                        .data
                                        ?.selectedAddress
                                        .addressLocationAsString ??
                                    '';
                                return AppShippingAdress(
                                  userAddressAsString: address,
                                );
                              }),
                        ),
                      ),
                      const AppVerticalPadding(),
                      Text(
                        'Orders list',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      StreamBuilder<List<CartItemUIModel>>(
                          stream: CartItemScreenBloc.cartItemScreenBloc
                              .observerCartItem(),
                          builder: (context, snapshot) {
                            List<CartItemUIModel> carts = snapshot.data ?? [];
                            return Column(
                              children: carts
                                  .asMap()
                                  .map(
                                    (index, item) => MapEntry(
                                      index,
                                      Column(
                                        children: [
                                          AppCartItem(
                                            enableDeleteButton: false,
                                            enablePlusAndMinusButtons: false,
                                            uiInfo: snapshot.data![index],
                                            onDelete: (id) {},
                                          ),
                                          const AppVerticalPadding(),
                                        ],
                                      ),
                                    ),
                                  )
                                  .values
                                  .toList(),
                            );
                          }),
                      const AppVerticalPadding(),
                      Text(
                        'Choose shipping',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.of(context).pushNamed(
                          ScreenRoute.shippingMethodPick.name,
                        ),
                        child: StreamBuilder<ShippingTypeForCartItemModel>(
                            stream: GlobalBloc.cartProvider
                                .observerTransportForCart(),
                            builder: (context, snapshot) {
                              final String text =
                                  snapshot.data?.selectedPromo.shippingTittle ??
                                      '';
                              return AppSelectingTile(
                                leadingIcon: Icon(
                                  Iconsax.truck,
                                  color: Theme.of(context).primaryColor,
                                ),
                                tittle: text.isNotEmpty
                                    ? text
                                    : 'Choose shipping type',
                              );
                            }),
                      ),
                      const AppVerticalPadding(),
                      Text(
                        'Promo code',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const AppVerticalPadding(),
                      StreamBuilder<PromosForCartItemModel>(
                          stream:
                              GlobalBloc.cartProvider.observerPromosForCart(),
                          builder: (context, snapshot) {
                            String promoCode =
                                snapshot.data?.selectedPromo.promoCodeName ??
                                    '';
                            return AppPromoCodeInput(
                              selectedPromoCodeAsString: promoCode,
                              onDeletePromo: () => CartItemScreenBloc
                                  .cartItemScreenBloc
                                  .clearPromo(),
                            );
                          }),
                      const AppVerticalPadding(),
                      StreamBuilder<int>(
                          stream: CartItemScreenBloc.cartItemScreenBloc
                              .observerTotalCount(),
                          builder: (context, snapshot) {
                            int totalCount = snapshot.data ?? 0;
                            return Container(
                              padding: EdgeInsets.all(
                                  AppStyleConfiguration.paddingSpacer),
                              child: AppMoneyCounting(
                                moneyList: MoneyCountUIModel(items: [
                                  MoneyRowUIModel(
                                      name: 'Amount', value: totalCount),
                                  MoneyRowUIModel(name: 'Shipping', value: 0),
                                ]),
                              ),
                            );
                          }),
                      const AppVerticalPadding(),
                      AppButton(
                        tittle: 'Continue to Payment',
                        onPresssed: () => Navigator.of(context).pushNamed(
                          ScreenRoute.paymentMethod.name,
                        ),
                      ),
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
