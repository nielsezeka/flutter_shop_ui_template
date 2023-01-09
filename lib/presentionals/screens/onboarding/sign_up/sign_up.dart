import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'sign_up_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final SignUpBloc loginBloc = SignUpBloc();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: AppHorizontalPaddingChild(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppIconWithText(),
                  const AppVerticalPadding(
                    multiplier: 2,
                  ),
                  const AppVerticalPadding(),
                  Text(
                    AppLocalizations.of(context)!.signupTittle,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const AppVerticalPadding(),
                  AppInputField(
                    hintText: AppLocalizations.of(context)!.username,
                    leading: Iconsax.user,
                  ),
                  const AppVerticalPadding(),
                  AppInputField(
                    hintText: AppLocalizations.of(context)!.password,
                    leading: Iconsax.lock,
                    isSecured: true,
                  ),
                  const AppVerticalPadding(),
                  StreamBuilder<bool>(
                      stream: loginBloc.isRememberStream,
                      builder: (context, snapshot) {
                        return AppTickWithDescriptionText(
                          tittle: AppLocalizations.of(context)!.remember,
                          isShowTickIcon: snapshot.data ?? false,
                          onPressed: () => loginBloc.toggleRemember(),
                        );
                      }),
                  const AppVerticalPadding(),
                  AppButton(
                    tittle: AppLocalizations.of(context)!.signup,
                    onPresssed: () => Navigator.of(context).pushNamed(
                      ScreenRoute.setupProfile.name,
                    ),
                  ),
                  const AppVerticalPadding(),
                  AppTextClickable(
                    tittle: AppLocalizations.of(context)!.forgot,
                    onPressed: () => Navigator.of(context).pushNamed(
                      ScreenRoute.login.name,
                    ),
                  ),
                  const AppVerticalPadding(),
                  const VerticalSliderWithText(),
                  const AppVerticalPadding(),
                  AppSocialButtons(),
                  const AppVerticalPadding(),
                  AppTextClickableWithDescription(
                    clickableText: AppLocalizations.of(context)!.signin,
                    normalText: AppLocalizations.of(context)!.alreadyHasAccount,
                    onPressed: () => Navigator.of(context).pushNamed(
                      ScreenRoute.login.name,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
