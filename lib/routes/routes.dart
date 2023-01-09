import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:page_route_animator/page_route_animator.dart';
import '../presentionals/presentionals_index.dart';

class Routes {
  static Map<String, Widget> _getRoutes() {
    return {
      ScreenRoute.startScreen.name: const SplashLoadingScreen(),
      ScreenRoute.home.name: const MainTabbar(),
      ScreenRoute.notifications.name: const NotificationScreen(),
      ScreenRoute.wishlist.name: const MyWishListScreen(),
      ScreenRoute.allProducts.name: const AllProductsScreen(),
      ScreenRoute.detailProduct.name: const DetailProduct(),
      ScreenRoute.reviews.name: const ReviewScreen(),
      ScreenRoute.checkout.name: const CheckOutScreen(),
      ScreenRoute.addressPick.name: const ShippingPickingScreen(),
      ScreenRoute.shippingMethodPick.name: const ShippingMethodPicking(),
      ScreenRoute.shippingPromoPick.name: const ShippingPromoPicking(),
      ScreenRoute.paymentMethod.name: const PaymentMethodScreen(),
      ScreenRoute.order.name: const OrderScreen(),
      ScreenRoute.topupEWallet.name: const TopupEWallet(),
      ScreenRoute.topupEWalletCharge.name: const TopupEWalletCharge(),
      ScreenRoute.topUpEnterPIN.name: const SetupPIN(),
      ScreenRoute.walletHistory.name: const WalletHistoryItems(),
      ScreenRoute.profile.name: const ProfileMain(),
      ScreenRoute.onboardBase.name: const OnboardingBase(),
      ScreenRoute.onboardScrolling.name: const OnboardingScrolling(),
      ScreenRoute.login.name: const Login(),
      ScreenRoute.signup.name: const SignUp(),
      ScreenRoute.mainTabbar.name: const MainTabbar(),
      ScreenRoute.setupProfile.name: const AccountSetup(),
      ScreenRoute.setupPIN.name: const SetupPIN(),
      ScreenRoute.trackOrder.name: const TrackOrder(),
      ScreenRoute.notificationSetting.name: const NotificationSettingScreen(),
      ScreenRoute.settingAddress.name: const ProfileAddressSetting(),
      ScreenRoute.profileAddressAdd.name: const ProfileAddressAdd(),
      ScreenRoute.paymentSetting.name: const PaymentSetting(),
      ScreenRoute.paymentAdding.name: const PaymentAdding(),
    };
  }

  static PageRouteAnimator? buildRoutesWithAnimate(RouteSettings settings) {
    final route = _getRoutes()
        .entries
        .firstWhereOrNull((element) => element.key == settings.name);
    if (route?.value != null) {
      return PageRouteAnimator(
        child: route!.value,
        routeAnimation: RouteAnimation.rightToLeft,
        settings: settings,
        curve: Curves.fastOutSlowIn,
      );
    }
    debugPrint('[error]Not found screen ${settings.name}');
    return null;
  }
}

enum ScreenRoute {
  startScreen,
  onboardScrolling,
  onboardBase,
  login,
  mainTabbar,
  signup,
  home,
  notifications,
  wishlist,
  allProducts,
  detailProduct,
  reviews,
  checkout,
  addressPick,
  shippingMethodPick,
  shippingPromoPick,
  paymentMethod,
  order,
  topupEWallet,
  topupEWalletCharge,
  topUpEnterPIN,
  walletHistory,
  profile,
  setupProfile,
  setupPIN,
  trackOrder,
  notificationSetting,
  settingAddress,
  profileAddressAdd,
  paymentSetting,
  paymentAdding,
}

extension RouteToRawString on ScreenRoute {
  String get name {
    switch (this) {
      case ScreenRoute.startScreen:
        return '/';
      case ScreenRoute.home:
        return '/home';
      case ScreenRoute.detailProduct:
        return '/detailProduct';
      case ScreenRoute.notifications:
        return '/notifications';
      case ScreenRoute.wishlist:
        return '/wishlist';
      case ScreenRoute.allProducts:
        return '/allProducts';
      case ScreenRoute.reviews:
        return '/reviews';
      case ScreenRoute.checkout:
        return '/checkout';
      case ScreenRoute.addressPick:
        return '/addressPick';
      case ScreenRoute.shippingMethodPick:
        return '/shippingMethodPick';
      case ScreenRoute.shippingPromoPick:
        return '/shippingPromoPick';
      case ScreenRoute.paymentMethod:
        return '/paymentMethod';
      case ScreenRoute.order:
        return '/order';
      case ScreenRoute.topupEWallet:
        return '/topupEWallet';
      case ScreenRoute.topupEWalletCharge:
        return '/topupEWalletCharge';
      case ScreenRoute.topUpEnterPIN:
        return '/topUpEnterPIN';
      case ScreenRoute.walletHistory:
        return '/walletHistory';
      case ScreenRoute.profile:
        return '/profile';
      case ScreenRoute.onboardBase:
        return '/onboardBase';
      case ScreenRoute.onboardScrolling:
        return '/onboardScrolling';
      case ScreenRoute.login:
        return '/login';
      case ScreenRoute.signup:
        return '/signup';
      case ScreenRoute.mainTabbar:
        return '/mainTabbar';
      case ScreenRoute.setupProfile:
        return '/setupProfile';
      case ScreenRoute.setupPIN:
        return '/setupPIN';
      case ScreenRoute.trackOrder:
        return '/trackOrder';
      case ScreenRoute.notificationSetting:
        return '/notificationSetting';
      case ScreenRoute.settingAddress:
        return '/settingAddress';
      case ScreenRoute.profileAddressAdd:
        return '/profileAddressAdd';
      case ScreenRoute.paymentSetting:
        return '/paymentSetting';
      case ScreenRoute.paymentAdding:
        return '/paymentAdding';
      default:
        return '/';
    }
  }
}
