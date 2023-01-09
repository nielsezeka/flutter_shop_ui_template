import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import '../../../presentionals_index.dart';

class ProfileAddressSetting extends StatefulWidget {
  const ProfileAddressSetting({super.key});

  @override
  State<ProfileAddressSetting> createState() => _ProfileAddressSettingState();
}

class _ProfileAddressSettingState extends State<ProfileAddressSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Edit Address'),
            const AppVerticalPadding(),
            Expanded(
              child: StreamBuilder<UserInfoModel>(
                stream: GlobalBloc.userDataProvider.observerUserInfo(),
                builder: (context, snapshot) {
                  List<UserAddress> adresses = snapshot.data?.addresses ?? [];
                  return Column(
                    children: adresses
                        .map(
                          (e) => Column(
                            children: [
                              AppSelectAddressTile(
                                isPicked: false,
                                topTitle: e.addressName,
                                bottomDescription: e.addressLocationAsString,
                                enableEdittingBar: true,
                                onClickDelete: () => GlobalBloc.userDataProvider
                                    .deleteAddress(e),
                                onClickEdit: () {
                                  GlobalBloc.profileMainBloc
                                      .setFocusEditAddress(e);
                                  Navigator.of(context).pushNamed(
                                    ScreenRoute.profileAddressAdd.name,
                                  );
                                },
                              ),
                              const AppVerticalPadding(),
                            ],
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
            AppHorizontalPaddingChild(
              child: AppButton(
                tittle: 'Add New Address',
                onPresssed: () => Navigator.of(context).pushNamed(
                  ScreenRoute.profileAddressAdd.name,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
