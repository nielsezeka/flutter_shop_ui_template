import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import '../home_screen_ui_model.dart';
import 'all_products_screen_bloc.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  final AllProductsScreenBloc _myWishListScreebBloc = AllProductsScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              const AppNavigationBar(tittle: 'All products'),
              Expanded(
                child: StreamBuilder<CategoryUIModel>(
                    stream: _myWishListScreebBloc.observerWishList(),
                    builder: (context, snapshot) {
                      final wishlistItems = snapshot.data?.products ?? [];
                      return Column(
                        children: [
                          AppBubbleSelection(
                            selectedIndex: snapshot.data?.selectedIndex ?? 0,
                            items: snapshot.data?.categories ?? [],
                            onClicked: (index) {
                              _myWishListScreebBloc.onSelectCategory(index);
                            },
                          ),
                          const AppVerticalPadding(),
                          (wishlistItems.isNotEmpty)
                              ? Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          AppDoubleThumnailInRow(
                                            leftItem:
                                                wishlistItems[index].first,
                                            rightItem:
                                                wishlistItems[index].length > 1
                                                    ? wishlistItems[index].last
                                                    : null,
                                          ),
                                          const AppVerticalPadding(
                                            multiplier: 2,
                                          ),
                                        ],
                                      );
                                    },
                                    itemCount: wishlistItems.length,
                                  ),
                                )
                              : Container()
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
