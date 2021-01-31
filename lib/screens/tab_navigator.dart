import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/controller/homeController.dart';
import 'package:tomato/screens/food_screen.dart';
import 'package:tomato/screens/orders_screen.dart';
import 'package:tomato/screens/venders_screen.dart';

class TabNavigator extends StatelessWidget {
  HomeController _homeControllerState;
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  TabNavigator({Key key, this.navigatorKey, this.tabItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    Widget child;

    if (tabItem == "Page1")
      child = VendersScreen();
    else if (tabItem == "Page2")
      child = FoodScreen();
    else if (tabItem == "Page3") child = OrderScreen();

    return Container(
child:child,      
      
    );
  }
}
