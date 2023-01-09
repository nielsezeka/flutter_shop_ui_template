import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../bloc/global_bloc.dart';
import '../../../services/service_index.dart';

class OrderStatusHistoryNode {
  final String status;
  final String location;
  final DateTime date;

  OrderStatusHistoryNode({
    required this.status,
    required this.location,
    required this.date,
  });
}

class OrderItemUIModel {
  final String imageUrl;
  final int price;
  final int quantity;
  final String name;
  final String cartItemId;
  final List<OrderStatusHistoryNode> histories;
  OrderItemUIModel({
    required this.imageUrl,
    required this.price,
    required this.cartItemId,
    required this.name,
    required this.quantity,
    required this.histories,
  });

  OrderItemUIModel.from(
    OrderServerResponse product,
  )   : imageUrl = product.imageUrl,
        price = product.price,
        cartItemId = product.productID,
        name = product.name,
        quantity = product.quantity,
        histories = product.detailStatus
            .map(
              (e) => OrderStatusHistoryNode(
                  date: e.date, location: e.location, status: e.status),
            )
            .toList();
}

enum OrderTileType {
  inDelivery,
  completed,
  review,
}

extension OrderTileTypeDisplayable on OrderTileType {
  String getDisplayText() {
    switch (this) {
      case OrderTileType.completed:
        return 'Leave a review';
      case OrderTileType.inDelivery:
        return 'Track Order';
      default:
        return '';
    }
  }
}

class AppOrderTile extends StatefulWidget {
  const AppOrderTile({super.key, required this.uiInfo, required this.tileType});
  final OrderItemUIModel uiInfo;
  final OrderTileType tileType;
  @override
  State<AppOrderTile> createState() => _AppOrderTileState();
}

class _AppOrderTileState extends State<AppOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: CustomTheme.animationDuration,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        height: AppStyleConfiguration.itemDefaultHeight * 2.5,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: widget.uiInfo.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AutoSizeText(
                            widget.uiInfo.name,
                            style: Theme.of(context).textTheme.headline6,
                            maxLines: 1,
                            minFontSize: Theme.of(context)
                                .textTheme
                                .headline6!
                                .fontSize!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Quantity: ${widget.uiInfo.quantity}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '\$ 123',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    _renderButtonIfNeed(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderButtonIfNeed() {
    if (widget.tileType == OrderTileType.review) {
      return Container();
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _renderStatus(),
          AppButton(
            tittle: widget.tileType.getDisplayText(),
            height: AppStyleConfiguration.itemDefaultHeight / 3 * 2,
            onPresssed: () {
              if (widget.tileType == OrderTileType.inDelivery) {
                GlobalBloc.orderDataBloc.focusWatchOrder(widget.uiInfo);
                Navigator.of(context).pushNamed(ScreenRoute.trackOrder.name);
              } else {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return AppReviewAsk(
                      uiInfo: widget.uiInfo,
                      onConfirmed: () {},
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget _renderStatus() {
    if (widget.tileType != OrderTileType.inDelivery) {
      return Container();
    }
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
        borderRadius:
            BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AutoSizeText(
        'In delivery',
        maxLines: 1,
        minFontSize: 3,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Theme.of(context).primaryColor,
            ),
      ),
    );
  }
}
