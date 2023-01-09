import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({super.key});

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(
              tittle: 'Profile',
              useIconInsteadBackButton: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: AppHorizontalPaddingChild(
                  child: Column(
                    children: [
                      StreamBuilder<ProfileInfoUIModel>(
                          stream: GlobalBloc.profileMainBloc
                              .observerUserCommonInfo(),
                          builder: (context, snapshot) {
                            String userImageAvatar =
                                snapshot.data?.userImageAvatarurl ?? '';
                            return AppAvatarProfile(
                              imageAvatarUrl: userImageAvatar,
                            );
                          }),
                      AppSettingTile(
                        leading: Icon(Iconsax.user,
                            color: Theme.of(context).primaryColor),
                        center: Text(
                          'Edit Profile',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ScreenRoute.setupProfile.name);
                        },
                      ),
                      AppSettingTile(
                        leading: Icon(Iconsax.location5,
                            color: Theme.of(context).primaryColor),
                        center: Text(
                          'Address',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ScreenRoute.settingAddress.name);
                        },
                      ),
                      AppSettingTile(
                        leading: Icon(Iconsax.wallet,
                            color: Theme.of(context).primaryColor),
                        center: Text(
                          'Payment',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () => Navigator.of(context)
                            .pushNamed(ScreenRoute.paymentSetting.name),
                      ),
                      AppSettingTile(
                        leading: Icon(Iconsax.notification,
                            color: Theme.of(context).primaryColor),
                        center: Text(
                          'Notification',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ScreenRoute.notificationSetting.name);
                        },
                      ),
                      AppSettingTile(
                        leading: Icon(Iconsax.lock5,
                            color: Theme.of(context).primaryColor),
                        center: Text(
                          'Privacy Policy',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        onPressed: () {
                          launchUrl(
                            Uri.parse(
                                'https://www.freeprivacypolicy.com/blog/privacy-policy-url/'),
                          );
                        },
                      ),
                      AppSettingTile(
                        leading: Icon(
                          Iconsax.logout,
                          color: Theme.of(context).errorColor,
                        ),
                        center: Text(
                          'Logout',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).errorColor,
                                  ),
                        ),
                        onPressed: () {
                          GlobalBloc.userDataProvider.logout();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              ScreenRoute.login.name,
                              (Route<dynamic> route) => false);
                        },
                        trailing: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppStyleConfiguration.paddingSpacer),
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    'Kazenki @2022',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
