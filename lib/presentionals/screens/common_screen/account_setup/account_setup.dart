import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';

class AccountSetup extends StatefulWidget {
  const AccountSetup({super.key});

  @override
  State<AccountSetup> createState() => _AccountSetupState();
}

class _AccountSetupState extends State<AccountSetup> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            const AppNavigationBar(tittle: 'Setup your profile'),
            Expanded(
              child: AppHorizontalPaddingChild(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          AvatarProfilePicker(
                            onClickSelectAvatar: () {},
                          ),
                        ],
                      ),
                      const AppVerticalPadding(),
                      Divider(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                      ),
                      const AppInputField(hintText: 'Full name'),
                      const AppVerticalPadding(),
                      const AppInputField(hintText: 'Nick name'),
                      const AppVerticalPadding(),
                      const AppInputField(hintText: 'Email'),
                      const AppVerticalPadding(),
                      AppInputField(
                        hintText: 'Date of birth',
                        trailing: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => _selectDate(context),
                          child: Icon(
                            Iconsax.calendar,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const AppVerticalPadding(),
                      AppButton(
                        tittle: 'Continue',
                        onPresssed: () => Navigator.of(context).pushNamed(
                          ScreenRoute.setupPIN.name,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
}
