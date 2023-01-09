import 'package:rxdart/subjects.dart';
import '../../services/service_index.dart';
import '../global_bloc.dart';

class ProductsDataBloc {
  final BehaviorSubject<ProductModeFromBackend?> _focusingProduct =
      BehaviorSubject<ProductModeFromBackend?>.seeded(null);
  startProvider() {
    // Replace this function by requesting some thing from server....
    // Start fetching by put the page 0 to api/DB
    AppServices.productServerProviable.getProductsFor(page: 0);
  }

  BehaviorSubject<ProductModeFromBackend?> observerFocusingProduct() {
    return _focusingProduct;
  }

  setFocusProduct(String idToFocus) async {
    final item = await AppServices.productServerProviable
        .getProductsDetail(itemId: idToFocus);
    _focusingProduct.add(item);
  }

  BehaviorSubject<List<ProductModeFromBackend>> observerAllProducts() {
    return AppServices.productServerProviable.obseverProducts();
  }

  BehaviorSubject<List<String>> getAllCategories() {
    return AppServices.productServerProviable.obseverCategories();
  }
}
