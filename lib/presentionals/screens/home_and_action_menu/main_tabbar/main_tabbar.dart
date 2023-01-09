import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';
import 'package:iconsax/iconsax.dart';

class MainTabbar extends StatefulWidget {
  const MainTabbar({super.key});

  @override
  State<MainTabbar> createState() => _MainTabbarState();
}

class _MainTabbarState extends State<MainTabbar> {
  PageController? controller;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CardItemScreen(),
    OrderScreen(),
    MyWalletScreen(),
    ProfileMain(),
  ];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: StreamBuilder<List<CartItem>>(
                stream: GlobalBloc.cartProvider.observerCartItems(),
                builder: (context, snapshot) {
                  final int itemInCart = snapshot.data?.length ?? 0;
                  return itemInCart > 0
                      ? Badge(
                          badgeContent: Text(itemInCart.toString()),
                          child: const Icon(Iconsax.buy_crypto),
                        )
                      : const Icon(Iconsax.buy_crypto);
                }),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.receipt),
            label: 'Order',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.wallet),
            label: 'Wallet',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Iconsax.user),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).textTheme.bodyText1!.color,
        onTap: (index) {
          controller?.animateToPage(
            index,
            duration: CustomTheme.animationDuration,
            curve: Curves.easeInOut,
          );
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
