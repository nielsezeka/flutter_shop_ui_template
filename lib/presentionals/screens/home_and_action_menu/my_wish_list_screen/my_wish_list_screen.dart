import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import '../home_screen_ui_model.dart';
import 'my_wish_lish_bloc.dart';

class MyWishListScreen extends StatefulWidget {
  const MyWishListScreen({super.key});

  @override
  State<MyWishListScreen> createState() => _MyWishListScreenState();
}

class _MyWishListScreenState extends State<MyWishListScreen> {
  final MyWishListScreebBloc _myWishListScreebBloc = MyWishListScreebBloc();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              const AppNavigationBar(tittle: 'My Wish List'),
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
