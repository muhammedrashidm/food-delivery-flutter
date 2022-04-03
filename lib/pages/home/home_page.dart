import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/pages/cart_page/cart_history.dart';
import 'package:food_delivery/pages/cart_page/cart_page.dart';
import 'package:food_delivery/pages/food_main/main_food_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;

  List<Widget> pages = [
    const MainFoodPage(),
    Container(
      child: const Center(
        child: const Text('Feed'),
      ),
    ),
    CartPage(),
    Container(
      child: const Center(
        child: Text('next next next nxt page'),
      ),
    ),
    CartHistory()
  ];

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.news),
          title: ("Feed"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.cart),
          title: ("Cart"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.person_alt_circle),
          title: ("Account"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.archivebox),
          title: ("History"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
    ];
  }

  int _selectedPageIndex = 0;
  void onTapNav(int index) => setState(() => _selectedPageIndex = index);
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: pages,
      items: _navBarItems(),
      navBarStyle: NavBarStyle.style1,
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[_selectedPageIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //          selectedFontSize: 0.0,
  //       unselectedFontSize: 0.0,
  //       selectedItemColor: AppColors.mainColor,
  //       unselectedItemColor: Colors.blueGrey,
  //       showSelectedLabels: false,
  //       showUnselectedLabels: false,
  //       onTap:onTapNav,
  //       currentIndex: _selectedPageIndex,
  //       items:   [
  //         const BottomNavigationBarItem(label: 'home', icon: const Icon(Icons.home_outlined)),
  //         const BottomNavigationBarItem(label: 'history', icon: Icon(Icons.archive)),
  //         const BottomNavigationBarItem(label: 'cart',icon: const Icon(Icons.shopping_cart)),
  //         const BottomNavigationBarItem(label: 'feed',icon: Icon(Icons.feed)),
  //         const BottomNavigationBarItem(label: 'me',icon: Icon(Icons.account_circle)),
  //       ],
  //     ),
  //   );
  // }
}

class sharedPref {}
