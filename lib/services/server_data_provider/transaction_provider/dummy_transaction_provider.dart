import '../server_data_provider.dart';

class DummyTransactionProvider implements TransactionServerProviable {
  // get all transaction from server,
  @override
  Future<List<TransactionModelServerResponse>> getTransactions() {
    return Future.delayed(const Duration(seconds: 1), () {
      return Future.value([
        TransactionModelServerResponse(
          amount: 10,
          name: 'Charged from apple pay Charged from apple pay',
          dateChange: DateTime.now().subtract(const Duration(hours: 24)),
          isIncrease: true,
          imageUrl:
              'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1373&q=80',
        ),
        TransactionModelServerResponse(
          amount: 10,
          name: 'Buy some item',
          dateChange: DateTime.now().subtract(const Duration(hours: 24)),
          isIncrease: false,
          imageUrl:
              'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1373&q=80',
        )
      ]);
    });
  }
}
