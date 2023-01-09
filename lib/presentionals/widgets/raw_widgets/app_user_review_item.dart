import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../services/service_index.dart';
import '../../presentionals_index.dart';

class AppUserReviewItemUIModel {
  final String avatarURL;
  final String userReviewName;
  final double ratingCount;
  final String reviewDescription;
  final int totalLike;
  final DateTime reviewDate;

  AppUserReviewItemUIModel(
      {required this.avatarURL,
      required this.userReviewName,
      required this.ratingCount,
      required this.reviewDescription,
      required this.totalLike,
      required this.reviewDate});
  AppUserReviewItemUIModel.from(ReviewServerResponse serverInfo)
      : avatarURL = serverInfo.userImageUrl,
        userReviewName = serverInfo.userName,
        ratingCount = serverInfo.userRating,
        reviewDescription = serverInfo.reviewedText,
        totalLike = serverInfo.totalLoved,
        reviewDate = serverInfo.reviewDate;
}

class AppUserReviewItem extends StatelessWidget {
  const AppUserReviewItem({super.key, required this.appUserReviewItemUIModel});
  final AppUserReviewItemUIModel appUserReviewItemUIModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppProfileAvatarWelcome(
                imageAvatarUrl: appUserReviewItemUIModel.avatarURL,
                welcomeMessage: '',
                userDisplayName: appUserReviewItemUIModel.userReviewName,
              ),
              const Spacer(),
              Text(
                '${appUserReviewItemUIModel.ratingCount} Stars',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          Text(
            appUserReviewItemUIModel.reviewDescription,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const AppVerticalPadding(),
          Row(
            children: [
              const Spacer(),
              Icon(Iconsax.heart5, color: Theme.of(context).primaryColor),
              Text(
                appUserReviewItemUIModel.totalLike.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Padding(
                  padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer)),
              Text(
                DateFormat('yyyy-MM-dd')
                    .format(appUserReviewItemUIModel.reviewDate),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.5)),
              )
            ],
          )
        ],
      ),
    );
  }
}
