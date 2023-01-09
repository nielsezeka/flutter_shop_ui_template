import 'package:flutter_shop_ui_template_for_sale/services/server_data_provider/products_provider/products_provider.dart';
import '../bloc/global_bloc.dart';
import 'auth_service/implementation/dummy_auth.dart';
import 'server_data_provider/transport/dummy_shipping_server_data_provider.dart';

export 'server_data_provider/order/order_server_data_provider.dart';
export 'auth_service/auth_serviceable.dart';
export 'server_data_provider/server_data_provider.dart';
export 'server_data_provider/promo_code/promo_code_dummy_server_data_provider.dart';
export 'server_data_provider/promo_code/promo_code_dummy_server_data_provider.dart';
export 'server_data_provider/transaction_provider/dummy_transaction_provider.dart';

class AppServices {
  // Please change it to your implement service in the real world.
  // We just put some dummy services here for demotration purpose...
  // so please replace all the dummy service with your own....
  static AuthServicable authService = DummyAuthService(
    usenameDemo: 'demo',
    passwordDemo: '123456',
  );
  static ReviewServerProviable reviewServerProviable =
      DummyReviewServerDataProvider();
  static PromoServerProviable promoServerDataProvider =
      DummyPromoServerDataProvider();
  static ShippingServerProviable shippingServerProviable =
      DummyShippingServerProviable();
  static OrderServerProviable orderServerProvider = OrderServerDataProvider();
  static ProductServerProviable productServerProviable =
      ProductServerProvider();
  static TransactionServerProviable transactionServerProviable =
      DummyTransactionProvider();
}
