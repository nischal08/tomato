import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/controller/homeController.dart';
import 'package:tomato/screens/product_detail_screen.dart';
import 'package:tomato/screens/vender_menu.dart';

class Home extends StatelessWidget {
  HomeController _homeControllerState;
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: _homeControllerState.widgetIndex,
        children: [
          _homeControllerState.screensList[_homeControllerState.bottomNavIndex],
          VenderMenu(),
          ProductDetailScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _homeControllerState.bottomNavIndex,
        items: [
          for (var key in _homeControllerState.bottomNavItemData.keys)
            BottomNavigationBarItem(
              icon: key,
              label: _homeControllerState.bottomNavItemData[key],
            ),
        ],
        selectedItemColor: CustomColors.lightRed,
        unselectedItemColor: CustomColors.lightBrown,
        onTap: _homeControllerState.onBottomNavClick,
      ),
    );
  }
}
