import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';

import '../../../theme/theme_index.dart';

class OnboardingBase extends StatefulWidget {
  const OnboardingBase({super.key});

  @override
  State<OnboardingBase> createState() => _OnboardingBaseState();
}

class _OnboardingBaseState extends State<OnboardingBase>
    with SingleTickerProviderStateMixin {
  final int milisecBetweenMoving = 500;
  bool isSelectedThemeStyle = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Stack(
        children: [
          SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: 150,
                  left: 10,
                  right: 0,
                  bottom: 0,
                  child: Image.asset('assets/img/plant_1.png'),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 10,
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.welcome,
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(),
                        ),
                        Text(
                          AppLocalizations.of(context)!.appName,
                          style:
                              Theme.of(context).textTheme.headline3?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.slogan,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          !isSelectedThemeStyle
              ? Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Choose Theme for demo',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                            const AppVerticalPadding(),
                            Text(
                              'Select your theme style to test (Note: We will delay 0.5 sec before your app auto move to next demoscreen after you make your choice)',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                            const AppVerticalPadding(),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                      tittle: 'Dark theme',
                                      onPresssed: () =>
                                          _excuteSelection(ThemeMode.dark)),
                                ),
                                const Padding(padding: EdgeInsets.all(5.0)),
                                Expanded(
                                    child: AppButton(
                                  tittle: 'Light theme',
                                  onPresssed: () =>
                                      _excuteSelection(ThemeMode.light),
                                ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  _excuteSelection(ThemeMode mode) {
    CustomTheme.setTheme(mode);
    setState(() {
      isSelectedThemeStyle = true;
    });
    Future.delayed(Duration(milliseconds: milisecBetweenMoving), () {
      Navigator.of(context).pushNamed(ScreenRoute.onboardScrolling.name);
    });
  }
}
