import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import '../../../presentionals_index.dart';

class ShippingPromoPicking extends StatefulWidget {
  const ShippingPromoPicking({super.key});

  @override
  State<ShippingPromoPicking> createState() => _ShippingPromoPickingState();
}

class _ShippingPromoPickingState extends State<ShippingPromoPicking> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Add Promo'),
            Center(
              child: SingleChildScrollView(
                child: StreamBuilder<PromosForCartItemModel>(
                  stream: GlobalBloc.cartProvider.observerPromosForCart(),
                  builder: (context, snapshot) {
                    List<PromoCode> promos = snapshot.data?.promosCode ?? [];
                    return Column(
                      children: promos
                          .map(
                            (e) => CupertinoButton(
                              onPressed: () =>
                                  GlobalBloc.cartProvider.changePromo(
                                e,
                              ),
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  const AppVerticalPadding(),
                                  AppSelectPromoTile(
                                    name: e.promoCodeName,
                                    description: e.promoDescription,
                                    isPicked: e.promoID ==
                                        (snapshot.data?.selectedPromo.promoID ??
                                            ''),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
