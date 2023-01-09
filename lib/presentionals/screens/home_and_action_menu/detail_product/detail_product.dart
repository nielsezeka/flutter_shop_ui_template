import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'detail_product_bloc.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final DetailProductBloc _detailProductBloc = DetailProductBloc();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: StreamBuilder<DetailProductUIModel?>(
          stream: _detailProductBloc.observerProduct(),
          builder: (builderContext, snapshot) {
            DetailProductUIModel? modelToDisplay = snapshot.data;
            if (modelToDisplay != null) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    floating: true,
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            modelToDisplay.imageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SafeArea(child: AppNavigationBar(tittle: '')),
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: AppDotIndicator(total: 3, currentSelected: 0),
                        ),
                      ],
                    ),
                    expandedHeight: 500,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return AppHorizontalPaddingChild(
                          child: Column(
                            children: [
                              const AppVerticalPadding(),
                              ProductNameWithFavouriteIcon(
                                  name: modelToDisplay.name),
                              StreamBuilder<int>(
                                  stream:
                                      _detailProductBloc.observerReviewCount(),
                                  builder: (context, snapshot) {
                                    int totalReviewCount = snapshot.data ?? 0;
                                    return AppRatingBarDetailItem(
                                      ratingAverage: modelToDisplay.averageRate,
                                      totalSold: modelToDisplay.totalSold,
                                      totalReviewCount: totalReviewCount,
                                    );
                                  }),
                              const AppVerticalPadding(),
                              Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                              AppDescriptionTextDetail(
                                description: modelToDisplay.description,
                              ),
                              const AppVerticalPadding(),
                              StreamBuilder<int>(
                                  stream:
                                      _detailProductBloc.observerCalculator(),
                                  builder: (context, snapshot) {
                                    int totalPrice = snapshot.data ?? 1;
                                    return AppQuantityManageWithText(
                                      quantity: totalPrice,
                                      itemID: modelToDisplay.productID,
                                      onChangedNumber: (value) {},
                                    );
                                  }),
                              const AppVerticalPadding(),
                              Divider(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                              StreamBuilder<int>(
                                  stream:
                                      _detailProductBloc.observerCalculator(),
                                  builder: (context, snapshot) {
                                    int item = snapshot.data ?? 0;
                                    return AppAddingProductBar(
                                      buttonTittle: 'Add to cart',
                                      onClick: () {
                                        _detailProductBloc.addToCart();
                                        Fluttertoast.showToast(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            msg: "Item Added to Cart",
                                            textColor: Colors.white,
                                            toastLength: Toast.LENGTH_LONG,
                                            timeInSecForIosWeb: 1);
                                      },
                                      totalCount: item,
                                    );
                                  }),
                            ],
                          ),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _detailProductBloc.dispose();
  }
}
