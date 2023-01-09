import 'dart:async';

import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../bloc/global_bloc.dart';

class DetailProductUIModel {
  final String productID;
  final String name;
  final String categories;
  final String description;
  final String imageURL;
  final bool isFavourite;
  final int price;
  final double averageRate;
  final int totalSold;
  final int quantity;
  DetailProductUIModel(
    this.productID,
    this.name,
    this.categories,
    this.description,
    this.imageURL,
    this.isFavourite,
    this.price,
    this.averageRate,
    this.totalSold,
    this.quantity,
  );
  DetailProductUIModel.from(ProductModeFromBackend serverModel)
      : productID = serverModel.productID,
        name = serverModel.name,
        categories = serverModel.categories,
        description = serverModel.description,
        imageURL = serverModel.imageURL,
        isFavourite = serverModel.isFavourite,
        price = serverModel.price,
        averageRate = serverModel.averageRate,
        totalSold = serverModel.totalSold,
        quantity = 1;
}

class DetailProductBloc {
  final BehaviorSubject<DetailProductUIModel?> _productStream =
      BehaviorSubject<DetailProductUIModel?>.seeded(null);
  late StreamSubscription _listenProducts;
  DetailProductBloc() {
    _listenProducts =
        GlobalBloc.productDataBloc.observerFocusingProduct().listen(
      (product) {
        if (product != null) {
          _productStream.add(
            DetailProductUIModel.from(
              product,
            ),
          );
          GlobalBloc.reviewProvider.requestGetReviews(product.productID);
        }
      },
    );
  }
  Stream<int> observerReviewCount() {
    return GlobalBloc.reviewProvider.observerReviews().switchMap(
          (value) => Stream.value(
            value.length,
          ),
        );
  }

  BehaviorSubject<DetailProductUIModel?> observerProduct() {
    return _productStream;
  }

  void addToCart() {
    GlobalBloc.cartProvider.confirmAddedToCart(
      itemId: observerProduct().value?.productID ?? '',
    );
  }

  Stream<int> observerCalculator() {
    return Rx.combineLatest2(
        observerProduct(),
        GlobalBloc.cartProvider
            .observerCartItems(isLoadAllItemNotAddedInCart: true),
        (DetailProductUIModel? a, List<CartItem> b) {
      final item =
          b.firstWhereOrNull((element) => element.itemID == a?.productID);
      if (item != null) {
        return item.numberOfItem * (_productStream.value?.price ?? 0);
      }
      return (_productStream.value?.price ?? 0);
    });
  }

  dispose() {
    _productStream.close();
    _listenProducts.cancel();
  }
}
