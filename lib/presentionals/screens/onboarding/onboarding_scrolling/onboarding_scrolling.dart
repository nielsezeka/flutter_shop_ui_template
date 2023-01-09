import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'onboarding_scrolling_bloc.dart';

class OnboardingScrolling extends StatefulWidget {
  const OnboardingScrolling({super.key});

  @override
  State<OnboardingScrolling> createState() => _OnboardingScrollingState();
}

class _OnboardingScrollingState extends State<OnboardingScrolling> {
  final onboardScrollBloc = OnboardScrollBloc();
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: StreamBuilder<List<OnboardScrollItem>>(
          stream: onboardScrollBloc.observerOnboarding(),
          builder: (context, snapshot) {
            List<OnboardScrollItem> onboardItems = snapshot.data ?? [];
            return Column(
              children: [
                _renderScrollImageArea(onboardItems),
                const AppVerticalPadding(),
                Expanded(
                  flex: 4,
                  child: AppHorizontalPaddingChild(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: StreamBuilder<String>(
                            stream: onboardScrollBloc.observerTextToDisplay(),
                            builder: (context, snapshot) {
                              String textToDisplay = snapshot.data ?? '';
                              return Center(
                                child: Text(
                                  textToDisplay,
                                  style: Theme.of(context).textTheme.headline4,
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                        ),
                        StreamBuilder<int>(
                          stream: onboardScrollBloc.observerIndex(),
                          builder: (context, snapshot) {
                            return AppDotIndicator(
                              total: onboardItems.length,
                              currentSelected: snapshot.data ?? 0,
                            );
                          },
                        ),
                        Expanded(
                          child: AppButton(
                              tittle: 'Next',
                              onPresssed: () {
                                final isLastItem = onboardScrollBloc
                                    .pressNextButtonAndCheckIfLastItem(
                                        _pageController);
                                if (isLastItem) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      ScreenRoute.login.name,
                                      (Route<dynamic> route) => false);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  _renderScrollImageArea(List<OnboardScrollItem> onboardItems) {
    return Expanded(
      flex: 6,
      child: PageView(
        allowImplicitScrolling: true,
        controller: _pageController,
        onPageChanged: (index) {
          onboardScrollBloc.acceptNewSelectedIndex(index);
        },
        children: onboardItems.map((e) => e.preview).toList(),
      ),
    );
  }
}
