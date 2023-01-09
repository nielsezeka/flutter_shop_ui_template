import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import '../../../presentionals_index.dart';

class ShippingMethodPicking extends StatefulWidget {
  const ShippingMethodPicking({super.key});

  @override
  State<ShippingMethodPicking> createState() => _ShippingMethodPickingState();
}

class _ShippingMethodPickingState extends State<ShippingMethodPicking> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Choose Shipping'),
            SingleChildScrollView(
              child: StreamBuilder<ShippingTypeForCartItemModel>(
                  stream: GlobalBloc.cartProvider.observerTransportForCart(),
                  builder: (context, snapshot) {
                    final List<ShippingType> types =
                        snapshot.data?.promosCode ?? [];
                    return Column(
                      children: types
                          .map(
                            (e) => Column(
                              children: [
                                AppSelectShippingMethodTile(
                                  onPressed: () => GlobalBloc.cartProvider
                                      .changeTransport(e),
                                  isPicked: e.shippingID ==
                                      (snapshot
                                              .data?.selectedPromo.shippingID ??
                                          ''),
                                  shippingDescription: e.shippingDescription,
                                  shippingName: e.shippingTittle,
                                ),
                                const AppVerticalPadding(),
                              ],
                            ),
                          )
                          .toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
