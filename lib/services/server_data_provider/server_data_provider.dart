import 'package:rxdart/rxdart.dart';

export './reviews/dummy_reviews_server_data_provider.dart';

abstract class ReviewServerProviable {
  Future<List<ReviewServerResponse>> getReviews({required String forItemID});
}

class ReviewServerResponse {
  final String userName;
  final String userImageUrl;
  final double userRating;
  final String itemReviewed;
  final String reviewedText;
  final int totalLoved;
  final DateTime reviewDate;

  ReviewServerResponse({
    required this.userName,
    required this.userImageUrl,
    required this.userRating,
    required this.totalLoved,
    required this.reviewDate,
    required this.itemReviewed,
    required this.reviewedText,
  });
}

abstract class PromoServerProviable {
  Future<List<PromoServerResponse>> getPromos({required String forItemID});
}

class PromoServerResponse {
  final String promoCodeName;
  final String promoTittle;
  final String promoDescription;
  final String promoID;

  PromoServerResponse({
    required this.promoCodeName,
    required this.promoID,
    required this.promoTittle,
    required this.promoDescription,
  });
}

abstract class ShippingServerProviable {
  Future<List<TransportServerResponse>> getShipping(
      {required String forItemID});
}

class TransportServerResponse {
  final String shippingTittle;
  final String shippingDescription;
  final String shippingID;
  final int cost;

  TransportServerResponse({
    required this.shippingID,
    required this.shippingTittle,
    required this.shippingDescription,
    required this.cost,
  });
}

abstract class OrderServerProviable {
  Future<List<OrderServerResponse>> getOrderInfor({
    required String forItemID,
  });
  Future<List<OrderServerResponse>> getOrderCompleted({
    required String forItemID,
  });
}

class OrderServerResponse {
  final List<OrderDetailServerResponse> detailStatus;
  final String orderItemId;
  final int price;
  final String imageUrl;
  final String name;
  final int quantity;
  final String productID;
  OrderServerResponse({
    required this.orderItemId,
    required this.price,
    required this.imageUrl,
    required this.detailStatus,
    required this.productID,
    required this.name,
    required this.quantity,
  });
}

class OrderDetailServerResponse {
  final String status;
  final String location;
  final DateTime date;

  OrderDetailServerResponse({
    required this.status,
    required this.location,
    required this.date,
  });
}

abstract class ProductServerProviable {
  void getProductsFor({required int page});
  Future<ProductModeFromBackend?> getProductsDetail({required String itemId});
  BehaviorSubject<List<ProductModeFromBackend>> obseverProducts();
  BehaviorSubject<List<String>> obseverCategories();
}

class ProductModeFromBackend {
  // The raw model info from server, should add json parser your self if need.
  final String productID;
  final String name;
  final String categories;
  final String description;
  final String imageURL;
  final bool isFavourite;
  final int price;
  final double averageRate;
  final int totalSold;

  ProductModeFromBackend({
    required this.productID,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.price,
    required this.categories,
    required this.totalSold,
    required this.averageRate,
    required this.isFavourite,
  });
}

class TransactionModelServerResponse {
  final String name;
  final String imageUrl;
  final DateTime dateChange;
  final int amount;
  final bool isIncrease;
  TransactionModelServerResponse({
    required this.name,
    required this.imageUrl,
    required this.dateChange,
    required this.amount,
    required this.isIncrease,
  });
}

abstract class TransactionServerProviable {
  Future<List<TransactionModelServerResponse>> getTransactions();
}
