import 'package:flutter/cupertino.dart';

class ProductDetailController extends ChangeNotifier {
  int currentProductSize = 0;
  List productSizeList = [
    "S",
    "M",
    "L",
  ];

  onProductSizeClick(int index) {
    currentProductSize = index;
    notifyListeners();
  }
}
