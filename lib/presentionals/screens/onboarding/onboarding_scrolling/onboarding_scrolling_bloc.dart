import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/theme_index.dart';
import 'package:rxdart/rxdart.dart';

class OnboardScrollItem {
  final Widget preview;
  final String text;

  OnboardScrollItem({
    required this.preview,
    required this.text,
  });
  static final List<OnboardScrollItem> sampleItems = [
    OnboardScrollItem(
      preview: Image.asset(
        'assets/img/plant_2.jpg',
        fit: BoxFit.cover,
      ),
      text: 'We provive high quality plants just for you',
    ),
    OnboardScrollItem(
      preview: Image.asset(
        'assets/img/plant_3.jpg',
        fit: BoxFit.cover,
      ),
      text: 'Your satisfaction is number one priority',
    ),
    OnboardScrollItem(
      preview: Image.asset(
        'assets/img/plant_4.jpg',
        fit: BoxFit.cover,
      ),
      text: "Let's shop your favourite plants",
    ),
  ];
}

class OnboardScrollBloc {
  final BehaviorSubject<List<OnboardScrollItem>> _onboardItems =
      BehaviorSubject<List<OnboardScrollItem>>.seeded(
          OnboardScrollItem.sampleItems);
  final BehaviorSubject<int> _selectedIndex = BehaviorSubject<int>.seeded(0);
  Stream<List<OnboardScrollItem>> observerOnboarding() {
    return _onboardItems;
  }

  acceptNewSelectedIndex(int index) {
    _selectedIndex.add(index);
  }

  Stream<int> observerIndex() {
    return _selectedIndex;
  }

  Stream<String> observerTextToDisplay() {
    return Rx.combineLatest2(_onboardItems, _selectedIndex,
        (List<OnboardScrollItem> listItem, int index) => listItem[index].text);
  }

  bool pressNextButtonAndCheckIfLastItem(PageController pageController) {
    final isLastPage = _selectedIndex.value == _onboardItems.value.length - 1;
    if (!isLastPage) {
      pageController.animateToPage(
        _selectedIndex.value + 1,
        duration: CustomTheme.animationDuration,
        curve: Curves.linear,
      );
    }
    return isLastPage;
  }
}
