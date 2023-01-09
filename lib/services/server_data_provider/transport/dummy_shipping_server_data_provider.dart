import 'package:flutter_shop_ui_template_for_sale/services/service_index.dart';

class DummyShippingServerProviable implements ShippingServerProviable {
  @override
  Future<List<TransportServerResponse>> getShipping(
      {required String forItemID}) {
    // should call api right here....
    return Future.value([
      TransportServerResponse(
        shippingID: '1',
        shippingTittle: "Economy",
        shippingDescription: 'Estimate arrival in 5 days',
        cost: 10,
      ),
      TransportServerResponse(
        shippingID: '2',
        shippingTittle: "Regular",
        shippingDescription: 'Estimate arrival in 4 days',
        cost: 20,
      ),
      TransportServerResponse(
        shippingID: '3',
        shippingTittle: "Cargo",
        shippingDescription: 'Estimate arrival in 2 days',
        cost: 30,
      ),
      TransportServerResponse(
        shippingID: '4',
        shippingTittle: "Express",
        shippingDescription: 'Estimate arrival in 30 minutes',
        cost: 40,
      ),
    ]);
  }
}
