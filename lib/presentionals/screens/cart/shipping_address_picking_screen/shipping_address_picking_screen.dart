import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class ShippingPickingScreen extends StatefulWidget {
  const ShippingPickingScreen({super.key});
  @override
  State<ShippingPickingScreen> createState() => _ShippingPickingScreenState();
}

class _ShippingPickingScreenState extends State<ShippingPickingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Shipping Address'),
            SingleChildScrollView(
              child: StreamBuilder<AddressForCartItemModel>(
                  stream: GlobalBloc.cartProvider.observerAddressForCart(),
                  builder: (context, snapshot) {
                    List<UserAddress> listAddresses =
                        snapshot.data?.userAdresses ?? [];
                    final String displayName =
                        snapshot.data?.selectedAddress.addressName ?? '';
                    return Column(
                      children: listAddresses
                          .map(
                            (e) => CupertinoButton(
                              onPressed: () =>
                                  GlobalBloc.cartProvider.changeAddress(
                                e,
                              ),
                              padding: EdgeInsets.zero,
                              child: Column(
                                children: [
                                  AppSelectAddressTile(
                                    isPicked: displayName == e.addressName,
                                    topTitle: e.addressName,
                                    bottomDescription:
                                        e.addressLocationAsString,
                                  ),
                                  AppVerticalPadding(),
                                ],
                              ),
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
