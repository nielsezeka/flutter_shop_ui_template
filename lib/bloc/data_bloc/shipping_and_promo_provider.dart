import 'package:rxdart/rxdart.dart';

import '../../services/service_index.dart';

class PromoCode {
  final String promoCodeName;
  final String promoTittle;
  final String promoDescription;
  final String promoID;

  PromoCode({
    required this.promoCodeName,
    required this.promoID,
    required this.promoTittle,
    required this.promoDescription,
  });

  PromoCode.from(PromoServerResponse response)
      : promoCodeName = response.promoCodeName,
        promoID = response.promoID,
        promoTittle = response.promoTittle,
        promoDescription = response.promoDescription;
}

class ShippingType {
  final String shippingTittle;
  final String shippingDescription;
  final String shippingID;
  final int cost;

  ShippingType({
    required this.shippingID,
    required this.shippingTittle,
    required this.shippingDescription,
    required this.cost,
  });
  ShippingType.from(TransportServerResponse response)
      : shippingID = response.shippingID,
        shippingTittle = response.shippingTittle,
        shippingDescription = response.shippingDescription,
        cost = response.cost;
}

class ShippingAndPromoProvider {
  BehaviorSubject<List<PromoCode>> promoCodesStream =
      BehaviorSubject<List<PromoCode>>.seeded([]);
  BehaviorSubject<List<ShippingType>> shippingTypesStream =
      BehaviorSubject<List<ShippingType>>.seeded([]);
  reloadPromoCodeFromServer(String itemID) async {
    final result =
        await AppServices.promoServerDataProvider.getPromos(forItemID: itemID);
    promoCodesStream.add(
      result.map((e) => PromoCode.from(e)).toList(),
    );
  }

  reloadShippingTypeFromServer(String itemID) async {
    final result = await AppServices.shippingServerProviable
        .getShipping(forItemID: itemID);
    shippingTypesStream.add(
      result.map((e) => ShippingType.from(e)).toList(),
    );
  }
}
