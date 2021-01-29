import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tomato/screens/food_screen.dart';
import 'package:tomato/screens/orders_screen.dart';
import 'package:tomato/screens/venders_screen.dart';

class HomeController extends ChangeNotifier {
  bool likeBtnFlag = false;

  onClickLikeBtn() {
    likeBtnFlag = !likeBtnFlag;
    notifyListeners();
  }

  List _screensList = [
    VendersScreen(),
    FoodScreen(),
    OrderScreen(),
  ];
  // ignore: unnecessary_getters_setters
  List get screensList => _screensList;

  // ignore: unnecessary_getters_setters
  set screensList(List value) => _screensList = value;

  var bottomNavItemData = {
    Icon(Icons.food_bank_outlined): 'Restaurant',
    Icon(Icons.fastfood_outlined): 'Food',
    Icon(Icons.local_dining_outlined): 'Order',
  };

  int _bottomNavIndex = 0;
  // ignore: unnecessary_getters_setters
  int get bottomNavIndex => _bottomNavIndex;

  // ignore: unnecessary_getters_setters
  set bottomNavIndex(int value) => _bottomNavIndex = value;

  onBottomNavClick(int index) {
    bottomNavIndex = index;
    notifyListeners();
  }

 
}
