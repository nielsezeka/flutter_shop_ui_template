import '../../service_index.dart';

class OrderServerDataProvider implements OrderServerProviable {
  @override
  Future<List<OrderServerResponse>> getOrderInfor({required String forItemID}) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return [
          OrderServerResponse(
            productID: '1',
            name: 'product 1',
            quantity: 2,
            orderItemId: '',
            price: 12,
            imageUrl:
                'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1373&q=80',
            detailStatus: [
              OrderDetailServerResponse(
                status: 'In shipping',
                location: '1234 ABC District',
                date: DateTime.now(),
              ),
              OrderDetailServerResponse(
                status: 'In shipping',
                location: '1234 ABC District',
                date: DateTime.now().subtract(const Duration(hours: 24)),
              ),
            ],
          )
        ];
      },
    );
  }

  @override
  Future<List<OrderServerResponse>> getOrderCompleted({
    required String forItemID,
  }) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return [
          OrderServerResponse(
            productID: '2',
            name: 'product 2',
            quantity: 5,
            orderItemId: '',
            price: 12,
            imageUrl:
                'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1373&q=80',
            detailStatus: [
              OrderDetailServerResponse(
                status: 'In shipping',
                location: '1234 ABC District',
                date: DateTime.now(),
              ),
              OrderDetailServerResponse(
                status: 'In shipping',
                location: '1234 ABC District',
                date: DateTime.now().subtract(const Duration(hours: 24)),
              ),
            ],
          )
        ];
      },
    );
  }
}
