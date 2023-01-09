import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import '../../presentionals_index.dart';

class ProductUIModel {
  final String productId;
  final bool isFavourite;
  final String imageThumnailUrl;
  final double ratingPoint;
  final int sold;
  final int pricing;

  ProductUIModel({
    required this.productId,
    required this.isFavourite,
    required this.imageThumnailUrl,
    required this.ratingPoint,
    required this.sold,
    required this.pricing,
  });
  ProductUIModel.fromBackend(ProductModeFromBackend backendProduct)
      : productId = backendProduct.productID,
        isFavourite = backendProduct.isFavourite,
        imageThumnailUrl = backendProduct.imageURL,
        ratingPoint = backendProduct.averageRate,
        sold = backendProduct.totalSold,
        pricing = backendProduct.price;
}

class AppThumnailItem extends StatelessWidget {
  const AppThumnailItem({
    super.key,
    this.height,
    this.width,
    required this.uiInfo,
  });
  final double? height;
  final double? width;
  final ProductUIModel uiInfo;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        GlobalBloc.productDataBloc.setFocusProduct(uiInfo.productId);
        Navigator.of(context).pushNamed(
          ScreenRoute.detailProduct.name,
        );
      },
      padding: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: SizedBox(
          width: width ?? 180,
          height: height ?? 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppThumnailImageIcon(
                imageUrl: uiInfo.imageThumnailUrl,
                isFavourite: uiInfo.isFavourite,
              ),
              const AppVerticalPadding(),
              AppRatingBar(
                ratingAverage: uiInfo.ratingPoint,
                totalSold: uiInfo.pricing,
              ),
              const AppVerticalPadding(),
              Text(
                '\$ ${uiInfo.pricing}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
