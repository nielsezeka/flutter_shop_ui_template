import 'package:rxdart/rxdart.dart';
import '../../presentionals/presentionals_index.dart';
import '../../services/service_index.dart';

class OrderDataBloc {
  final OrderServerDataProvider _orderServerDataProvider =
      OrderServerDataProvider();
  final BehaviorSubject<List<OrderItemUIModel>> _deliveringOrdersStream =
      BehaviorSubject<List<OrderItemUIModel>>.seeded([]);
  final BehaviorSubject<List<OrderItemUIModel>> _completedOrderStream =
      BehaviorSubject<List<OrderItemUIModel>>.seeded([]);
  final BehaviorSubject<OrderItemUIModel?> _focusOrderItem =
      BehaviorSubject<OrderItemUIModel?>.seeded(null);
  void reloadData({required String userID}) async {
    _getOrder(userID: userID);
    _getCompletedOrder(userID: userID);
  }

  _getCompletedOrder({required String userID}) async {
    final completedOrderInfo = await AppServices.orderServerProvider
        .getOrderCompleted(forItemID: userID);
    _completedOrderStream.add(
      completedOrderInfo
          .map(
            (e) => OrderItemUIModel.from(e),
          )
          .toList(),
    );
  }

  _getOrder({required String userID}) async {
    final orderInfo =
        await AppServices.orderServerProvider.getOrderInfor(forItemID: userID);
    _deliveringOrdersStream.add(
      orderInfo
          .map(
            (e) => OrderItemUIModel.from(e),
          )
          .toList(),
    );
  }

  observerOngoingOrder() {
    return _deliveringOrdersStream;
  }

  observerCompletedOrder() {
    return _completedOrderStream;
  }

  Stream<OrderItemUIModel?> observerFocusOrder() {
    return _focusOrderItem;
  }

  focusWatchOrder(OrderItemUIModel order) {
    _focusOrderItem.add(order);
  }
}
