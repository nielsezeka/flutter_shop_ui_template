import 'dart:math';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import '../server_data_provider.dart';

// This is the Mocking Api, you should replace it by your own code....
class ProductServerProvider implements ProductServerProviable {
  static final _randomCategory = [
    'All',
    'Mosserata',
    'Alle',
    'Palm',
    'Lemon Family',
  ];
  BehaviorSubject<List<ProductModeFromBackend>> products =
      BehaviorSubject<List<ProductModeFromBackend>>.seeded([]);
  BehaviorSubject<List<String>> categories =
      BehaviorSubject<List<String>>.seeded([]);
  @override
  BehaviorSubject<List<ProductModeFromBackend>> obseverProducts() {
    return products;
  }

  @override
  BehaviorSubject<List<String>> obseverCategories() {
    return categories;
  }

  @override
  Future<ProductModeFromBackend?> getProductsDetail({required String itemId}) {
    final item = products.value.firstWhereOrNull(
      (element) => element.productID == itemId,
    );
    if (item != null) {
      return Future.value(item);
    }
    return Future.value();
  }

  @override
  void getProductsFor({required int page}) {
    /// update the packages...
    /// please replace with your api you need
    List<ProductModeFromBackend> randomItem =
        List.generate(1000, (index) => _getDefault(index)).toList();
    products.add(randomItem);
    categories.add(_randomCategory);
  }

  static ProductModeFromBackend _getDefault(int index) {
    final randomName = List.generate(
      1000,
      (index) => 'Product $index',
    ).toList();
    final randomRate = List.generate(20, (index) => 2.0 + 0.1 * index).toList();
    final randomSold = List.generate(200, (index) => 100 + index).toList();
    final randomPrice = List.generate(40, (index) => 10 + index);
    final randomImage = [
      'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1373&q=80',
      'https://images.unsplash.com/photo-1555037015-1498966bcd7c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      'https://images.unsplash.com/photo-1533038590840-1cde6e668a91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    ];
    return ProductModeFromBackend(
      productID: index.toString(),
      name: randomName[Random().nextInt(randomName.length)],
      description:
          'The product index is $index. This is some random text for the description.',
      imageURL: randomImage[Random().nextInt(randomImage.length)],
      price: randomPrice[Random().nextInt(randomPrice.length)],
      categories: _randomCategory[Random().nextInt(_randomCategory.length)],
      totalSold: randomSold[Random().nextInt(randomSold.length)],
      averageRate: randomRate[Random().nextInt(randomRate.length)],
      isFavourite: Random().nextBool(),
    );
  }
}
