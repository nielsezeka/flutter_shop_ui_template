import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/composite_widgets/app_thumnail_item.dart';
import 'package:quiver/iterables.dart';
import 'package:rxdart/rxdart.dart';
import '../home_screen_ui_model.dart';

class HomeScreenUIModel {
  final String userName;
  final String userImageAvatarurl;
  final String greetingMessage;

  HomeScreenUIModel({
    required this.userName,
    required this.userImageAvatarurl,
    required this.greetingMessage,
  });
}

class HomeScreenBloc {
  final SubjectInt _selectedMostPopularCategoryIndex = SubjectInt.seeded(0);
  final BehaviorSubject<HomeScreenUIModel> _uiModel =
      BehaviorSubject<HomeScreenUIModel>.seeded(HomeScreenUIModel(
    userImageAvatarurl: '',
    userName: '',
    greetingMessage: '',
  ));
  HomeScreenBloc() {
    GlobalBloc.userDataProvider.observerUserInfo().switchMap((value) {
      return Stream.value(
        HomeScreenUIModel(
          userImageAvatarurl: value.userAvatarUrl,
          userName: value.name,
          greetingMessage: _greeting(),
        ),
      );
    }).listen((event) {
      _uiModel.add(event);
    });
  }

  observerUserInfo() {
    return _uiModel;
  }

  onSelectCategory(int index) {
    _selectedMostPopularCategoryIndex.add(index);
  }

  observerMostPopular() {
    return Rx.combineLatest3(
      GlobalBloc.productDataBloc.observerAllProducts(),
      GlobalBloc.productDataBloc.getAllCategories(),
      _selectedMostPopularCategoryIndex,
      (
        List<ProductModeFromBackend> backendItems,
        List<String> backendCategories,
        int currentSelectedCategory,
      ) {
        final allProduct = backendItems
            .map((product) => ProductUIModel.fromBackend(product))
            .toList()
            .sublist(0, 4); // forcing just 4 first item in the list!!
        return CategoryUIModel(
          backendCategories,
          currentSelectedCategory,
          partition(allProduct, 2).toList(),
        );
      },
    );
  }

  observerSpecialOffers() {
    /// just give you some stress test data!!!, it fill with 10000 item
    /// You may check performance!
    return GlobalBloc.productDataBloc.observerAllProducts().switchMap(
          (value) => Stream.value(
            value
                .map(
                  (e) => ProductUIModel.fromBackend(e),
                )
                .toList(),
          ),
        );
  }

  dispose() {
    _selectedMostPopularCategoryIndex.close();
  }

  String _greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}
