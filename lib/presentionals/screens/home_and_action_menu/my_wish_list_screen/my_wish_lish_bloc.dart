import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../bloc/global_bloc.dart';
import '../../../presentionals_index.dart';
import '../home_screen_ui_model.dart';

class MyWishListScreebBloc {
  final BehaviorSubject<int> _selectedCategoryIndexStream =
      BehaviorSubject<int>.seeded(0);
  onSelectCategory(int index) {
    _selectedCategoryIndexStream.add(index);
  }

  observerWishList() {
    return Rx.combineLatest3(
      GlobalBloc.productDataBloc.observerAllProducts(),
      GlobalBloc.productDataBloc.getAllCategories(),
      _selectedCategoryIndexStream,
      (
        List<ProductModeFromBackend> backendItems,
        List<String> backendCategories,
        int currentSelectedCategory,
      ) {
        final allProduct = backendItems
            .map((product) => ProductUIModel.fromBackend(product))
            .toList();
        return CategoryUIModel(
          backendCategories,
          currentSelectedCategory,
          partition(allProduct, 2).toList(),
        );
      },
    );
  }
}
