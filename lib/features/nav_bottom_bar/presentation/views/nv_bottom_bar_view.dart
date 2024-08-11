
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kafiil_task/core/utils/theming/colors.dart';
import 'package:kafiil_task/features/auth/data/models/auth_model/auth_model.dart';
import 'package:kafiil_task/features/countries/presentation/views/countries.dart';
import 'package:kafiil_task/features/services/presentation/views/services.dart';
import 'package:kafiil_task/features/who_am_i/presentation/views/who_am_i.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../auth/data/models/auth_model/auth_model.dart';

class NavBottomBarView extends StatelessWidget {
   const NavBottomBarView({super.key,required this.authModel ,});

 final  AuthModel authModel;

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
  List<Widget> _buildScreens() {
    return [
      WhoAmI(authModel:authModel),
       const CountriesView(),
      const ServicesViews(),

    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:  Icon(Ionicons.person_circle_outline,size: 20.h,),
        title: ("Who Am I"),
        activeColorPrimary: ColorManager.primary900,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:   Icon(Ionicons.earth_outline,size: 20.h,),
        title: ("Countries"),
        activeColorPrimary: ColorManager.primary900,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon:  Icon(Ionicons.cart_outline,size: 22.h,),
        title: ("Services"),
        activeColorPrimary: ColorManager.primary900,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
}