import '../server_data_provider.dart';

class DummyPromoServerDataProvider implements PromoServerProviable {
  // this is A dummy version of get reviews. in a real world application
  // please change it to your server
  @override
  Future<List<PromoServerResponse>> getPromos({required String forItemID}) {
    // should call api right here....
    return Future.value([
      PromoServerResponse(
        promoCodeName: 'PRM1',
        promoID: '1',
        promoTittle: "Special 25% off",
        promoDescription: 'Special only for you',
      ),
      PromoServerResponse(
        promoCodeName: 'PRM2',
        promoID: '2',
        promoTittle: "Discount 30% off",
        promoDescription: 'Special only for today!',
      ),
    ]);
  }
}
