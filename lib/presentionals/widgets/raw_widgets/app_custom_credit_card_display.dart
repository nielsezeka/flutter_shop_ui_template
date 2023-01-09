import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:icons_plus/icons_plus.dart';

class AppCustomCreditCardDisplay extends StatelessWidget {
  const AppCustomCreditCardDisplay({super.key, this.isShowTopUp});
  final bool? isShowTopUp;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(AppStyleConfiguration.paddingSpacer),
        height: AppStyleConfiguration.itemDefaultHeight * 4,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(
            AppStyleConfiguration.itemNormalRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Transform.rotate(
                angle: pi / 8,
                child: Icon(
                  FontAwesome.landmark,
                  color:
                      Theme.of(context).textTheme.bodyText1!.color!.withOpacity(
                            0.1,
                          ),
                  size: 150,
                ),
              ),
            ),
            StreamBuilder<UserInfoModel>(
                stream: GlobalBloc.userDataProvider.observerUserInfo(),
                builder: (context, snapshot) {
                  UserInfoModel? userInfo = snapshot.data;
                  if (userInfo != null) {
                    return Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                userInfo.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                '12345 ******* 123',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                'Your balance',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              Text(
                                '\$ ${userInfo.moneyInLocalWallet}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(
                                AppStyleConfiguration.paddingSpacer),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Logo(Logos.paypal),
                                    Padding(
                                      padding: EdgeInsets.all(
                                        AppStyleConfiguration.paddingSpacer,
                                      ),
                                    ),
                                    Logo(Logos.apple_pay),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Logo(Logos.google_pay),
                                    Padding(
                                      padding: EdgeInsets.all(
                                        AppStyleConfiguration.paddingSpacer,
                                      ),
                                    ),
                                    Logo(Logos.cc_visa),
                                  ],
                                ),
                                const Spacer(),
                                (isShowTopUp ?? false)
                                    ? CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        child: Material(
                                          color: Colors.transparent,
                                          child: Container(
                                            height: 55,
                                            padding: EdgeInsets.all(
                                              AppStyleConfiguration
                                                  .paddingSpacer,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    AppStyleConfiguration
                                                        .paddingSpacer),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Center(
                                                      child: Icon(
                                                        Bootstrap.download,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          AppStyleConfiguration
                                                              .paddingSpacer),
                                                    ),
                                                    Text(
                                                      'Top up',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onPressed: () => Navigator.of(context)
                                            .pushNamed(
                                                ScreenRoute.topupEWallet.name),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
