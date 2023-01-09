import 'package:rxdart/rxdart.dart';
import 'data_bloc/cart_provider/cart_provider.dart';
import 'data_bloc/order_data_bloc.dart';
import 'data_bloc/products_data_bloc.dart';
import 'data_bloc/profile_main_bloc.dart';
import 'data_bloc/reviews_provider.dart';
import 'data_bloc/shipping_and_promo_provider.dart';
import 'data_bloc/user_data_provider.dart';

// export for shorter import command
export 'data_bloc/products_data_bloc.dart';
export 'data_bloc/user_data_provider.dart';
export 'data_bloc/cart_provider/cart_provider.dart';
export 'data_bloc/reviews_provider.dart';
export 'data_bloc/shipping_and_promo_provider.dart';
export 'data_bloc/order_data_bloc.dart';
export 'package:flutter_shop_ui_template_for_sale/services/service_index.dart';
export 'data_bloc/profile_main_bloc.dart';

/// [Optional setting] Just a shorter name for behavior subject
/// You can use the original name if you want.
typedef SubjectInt = BehaviorSubject<int>;
typedef SubjectString = BehaviorSubject<String>;
typedef SubjectListString = BehaviorSubject<List<String>>;

class GlobalBloc {
  static ProductsDataBloc productDataBloc = ProductsDataBloc();
  static UserDataProvider userDataProvider = UserDataProvider();
  static CartProvider cartProvider = CartProvider();
  static ReviewProvider reviewProvider = ReviewProvider();
  static OrderDataBloc orderDataBloc = OrderDataBloc(); //should be bloc
  static ShippingAndPromoProvider shippingAndPromoProvider =
      ShippingAndPromoProvider();
  static ProfileMainBloc profileMainBloc = ProfileMainBloc();
  static initializeData() {
    productDataBloc.startProvider();
  }
}
