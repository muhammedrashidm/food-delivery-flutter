import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/cart_page/cart_history.dart';
import 'package:food_delivery/pages/cart_page/cart_page.dart';
import 'package:food_delivery/pages/feed_page/feed_page.dart';
import 'package:food_delivery/pages/food_main/main_food_page.dart';
import 'package:food_delivery/pages/profile_page/profile_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/user_controller.dart';
import '../../data/repositories/auth_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PersistentTabController _controller;


  List<Widget> pages = [
    const MainFoodPage(),
      const FeedPage(),
    const CartPage(),
    const ProfilePage(),
    const CartHistory()
  ];

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.news),
          title: ("Feed"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart),
          title: ("Cart"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.person_alt_circle),
          title: ("Account"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.archivebox),
          title: ("History"),
          activeColorPrimary: CupertinoColors.activeBlue,
          inactiveColorPrimary: CupertinoColors.systemGrey),
    ];
  }
  getToken() async {
    var t = await Get.find<AuthController>().getUserToken();
    Get.find<AuthRepo>().saveUserToken(t);
  }
  int _selectedPageIndex = 0;
  void onTapNav(int index) => setState(() => _selectedPageIndex = index);
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIN();
    if (_userLoggedIn) {
      getToken();
      Get.find<UserController>().getUserInfo();
    }    super.initState();
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
