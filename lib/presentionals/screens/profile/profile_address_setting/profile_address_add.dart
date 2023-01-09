import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';
import 'profile_address_add_bloc.dart';

class ProfileAddressAdd extends StatefulWidget {
  const ProfileAddressAdd({
    super.key,
  });
  @override
  State<ProfileAddressAdd> createState() => _ProfileAddressAddState();
}

class _ProfileAddressAddState extends State<ProfileAddressAdd> {
  final ProfileAddressAddBloc _profileAddressAddBloc = ProfileAddressAddBloc();
  @override
  Widget build(BuildContext context) {
    final currentSelectedAddress = GlobalBloc.profileMainBloc.currentFocus();
    final isEditting = (currentSelectedAddress != null);
    if (isEditting) {
      _profileAddressAddBloc.nameAddress
          .add(currentSelectedAddress.addressName);
      _profileAddressAddBloc.detailAddress
          .add(currentSelectedAddress.addressLocationAsString);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              AppNavigationBar(
                tittle: isEditting ? 'Edit Address' : 'Add New Address',
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(
                              AppStyleConfiguration.itemNormalRadius),
                        ),
                        child: Center(
                            child: Text(
                          'Your map should be here!!!',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                      ),
                    ),
                    const AppVerticalPadding(),
                    Center(
                      child: Text(
                        'Address Detail',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const AppVerticalPadding(),
                    Text(
                      'Name Address',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const AppVerticalPadding(),
                    AppInputField(
                      hintText: 'Address',
                      onTextChanged: (newValue) =>
                          _profileAddressAddBloc.nameAddress.add(newValue),
                      defaultText: currentSelectedAddress?.addressName,
                    ),
                    const AppVerticalPadding(),
                    Text(
                      'Address Detail',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const AppVerticalPadding(),
                    AppInputField(
                      hintText: 'Detail',
                      onTextChanged: (newValue) =>
                          _profileAddressAddBloc.detailAddress.add(newValue),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(
                          Iconsax.location,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      defaultText:
                          currentSelectedAddress?.addressLocationAsString,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              AppButton(
                tittle: isEditting ? 'Edit Address' : 'Add Address',
                onPresssed: () {
                  if (isEditting) {
                    GlobalBloc.userDataProvider.editAddress(
                      _profileAddressAddBloc.nameAddress.value,
                      _profileAddressAddBloc.detailAddress.value,
                    );
                  } else {
                    GlobalBloc.userDataProvider.addNewAddress(
                      _profileAddressAddBloc.nameAddress.value,
                      _profileAddressAddBloc.detailAddress.value,
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
