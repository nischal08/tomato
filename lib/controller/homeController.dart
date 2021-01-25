import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeController extends ChangeNotifier {
  int _categoryIndex;
  // ignore: unnecessary_getters_setters
  int get categoryIndex => _categoryIndex;

  String _userImageUrl =
      "https://scontent.fktm3-1.fna.fbcdn.net/v/t1.0-9/122777514_4658406440867560_8980358279672578081_o.jpg?_nc_cat=111&ccb=2&_nc_sid=09cbfe&_nc_ohc=j_GSxid7-BkAX-0N8un&_nc_ht=scontent.fktm3-1.fna&oh=a792f16e8aeb45b8fcb7e52017583779&oe=602C5F51";
  // ignore: unnecessary_getters_setters
  String get userImgUrl => _userImageUrl;

  Map<String, String> _categoryList = {
    "All": "assets/foods/burger.png",
    "Fast food": "assets/foods/fries.png",
    "Bakery": "assets/foods/cake.png",
    "Drinks": "assets/foods/beverage.png",
  };
  // ignore: unnecessary_getters_setters
  Map get categoryList => _categoryList;
}
