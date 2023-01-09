import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';

class OrderScreenBloc {
  OrderScreenBloc() {
    final currentLoggedUser =
        GlobalBloc.userDataProvider.observerUserInfo().value;
    GlobalBloc.orderDataBloc.reloadData(
      userID: currentLoggedUser.localPIN,
    );
  }
}
