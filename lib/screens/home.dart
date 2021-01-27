import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/controller/homeController.dart';

class Home extends StatelessWidget {
  HomeController _homeControllerState;
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body:
          _homeControllerState.screensList[_homeControllerState.bottomNavIndex],
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
