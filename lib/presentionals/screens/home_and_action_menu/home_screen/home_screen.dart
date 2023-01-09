import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'home_screen_bloc.dart';
import '../home_screen_ui_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final HomeScreenBloc homePageBloc = HomeScreenBloc();
  @override
  void dispose() {
    super.dispose();
    homePageBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppVerticalPadding(),
              StreamBuilder<HomeScreenUIModel>(
                  stream: homePageBloc.observerUserInfo(),
                  builder: (context, snapshot) {
                    final String currentUserNameDisplay =
                        snapshot.data?.userName ?? '';
                    final String grettingMessage =
                        snapshot.data?.greetingMessage ?? '';
                    return AppWelcomeHeader(
                      onClickNotification: () =>
                          Navigator.of(context).pushNamed(
                        ScreenRoute.notifications.name,
                      ),
                      onClickFavourite: () => Navigator.of(context).pushNamed(
                        ScreenRoute.wishlist.name,
                      ),
                      userName: currentUserNameDisplay,
                      greetingMessage: grettingMessage,
                    );
                  }),
              const AppVerticalPadding(),
              const AppSearchBar(),
              const AppVerticalPadding(),
              _renderScrolling(),
            ],
          ),
        ),
      ),
    );
  }

  _renderScrolling() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppSectionLabelWithChild(
              tittle: 'Special Offers',
              onSelectAll: () => Navigator.of(context).pushNamed(
                ScreenRoute.allProducts.name,
              ),
              child: SizedBox(
                height: 200,
                child: StreamBuilder<List<ProductUIModel>>(
                    stream: homePageBloc.observerSpecialOffers(),
                    builder: (context, snapshot) {
                      List<ProductUIModel> items = snapshot.data ?? [];
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              right: AppStyleConfiguration.paddingSpacer,
                            ),
                            child: AppThumnailItem(
                              height: 200,
                              width: 200,
                              uiInfo: items[index],
                            ),
                          );
                        },
                        itemCount: items.length,
                      );
                    }),
              ),
            ),
            const AppVerticalPadding(),
            AppSectionLabelWithChild(
              onSelectAll: () => Navigator.of(context).pushNamed(
                ScreenRoute.allProducts.name,
              ),
              tittle: 'Most popular',
              child: StreamBuilder<CategoryUIModel>(
                stream: homePageBloc.observerMostPopular(),
                builder: (context, snapshot) {
                  List<List<ProductUIModel>> mostPopulars =
                      snapshot.data?.products ?? [];
                  return Column(
                    children: [
                      AppBubbleSelection(
                        selectedIndex: snapshot.data?.selectedIndex ?? 0,
                        items: snapshot.data?.categories ?? [],
                        onClicked: (index) {
                          homePageBloc.onSelectCategory(index);
                        },
                      ),
                      const AppVerticalPadding(),
                      (mostPopulars.isNotEmpty)
                          ? Wrap(
                              spacing: 10,
                              children: mostPopulars
                                  .map((e) => Column(
                                        children: [
                                          AppDoubleThumnailInRow(
                                            leftItem: e.first,
                                            rightItem:
                                                e.length > 1 ? e.last : null,
                                          ),
                                          const AppVerticalPadding(),
                                        ],
                                      ))
                                  .toList(),
                            )
                          : Container()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
