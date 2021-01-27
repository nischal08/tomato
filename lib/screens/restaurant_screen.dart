import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/controller/restaurantController.dart';
import 'package:tomato/widgets/productCard.dart';
import 'package:tomato/screens/vender_detail.dart';

// ignore: must_be_immutable
class RestaurantScreen extends StatelessWidget {
  var _theme = Theme.of(Get.context);
  TextTheme _themeData = Theme.of(Get.context).textTheme;
  RestaurantController _restaurantControllerState;
  @override
  Widget build(BuildContext context) {
    _restaurantControllerState = Provider.of<RestaurantController>(context);
    return _body();
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _userInfo(),
            SizedBox(
              height: 35,
            ),
            _search(),
            SizedBox(
              height: 30,
            ),
            _category(),
            SizedBox(
              height: 20,
            ),
            _vender(),
          ],
        ),
      ),
    );
  }

  Widget _vender() {
    return Expanded(
      child: ListView(
        children: [
          for (int i = 0; i < 8; i++)
            GestureDetector(
              onTap: () {
                Get.to(VenderDetail());
              },
              child: ProductCard(
                favFood: "Sekuwa",
                venderName: "BajekoSeKuwa",
                rating: 4.5,
                assetUrl: 'assets/venders/bajeko.jpg',
              ),
            ),
        ],
      ),
    );
  }

  _userInfo() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _greeting(),
          _userProfileImg(),
        ],
      ),
    );
  }

  _userProfileImg() {
    return Container(
      height: 45,
      width: 45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(_restaurantControllerState.userImgUrl),
      ),
    );
  }

  Widget _greeting() {
    return RichText(
      text: TextSpan(
        text: "Good Morning, ",
        style: _themeData.subtitle1,
        children: [
          TextSpan(
            text: "Nischal",
            style: _themeData.subtitle2,
          ),
        ],
      ),
    );
  }

  _search() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _searchTitle(),
          _searchIcon(),
        ],
      ),
    );
  }

  _searchTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Find your", style: _themeData.headline5),
        Text("favourite foods", style: _themeData.headline6),
      ],
    );
  }

  _searchIcon() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: _theme.cardColor,
        onPressed: () => print("search"),
        child: Icon(
          Icons.search_outlined,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _category() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      height: 50,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        for (var key in _restaurantControllerState.categoryList.keys)
          _eachCategory(
            label: key,
            assetUrl: _restaurantControllerState.categoryList[key],
          ),
      ]),
    );
  }

  Widget _eachCategory({
    String assetUrl,
    String label,
  }) {
    return GestureDetector(
      onTap: () {
        _restaurantControllerState.onClickCategory(currentKey: label);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _restaurantControllerState.categoryKey == label
              ? CustomColors.lightRed
              : _theme.cardColor,
        ),
        child: Row(
          children: [
            assetUrl == null
                ? SizedBox()
                : SizedBox(
                    height: 30,
                    child: Image.asset(
                      assetUrl,
                    ),
                  ),
            SizedBox(
              width:
                  (assetUrl == null || label == "Bakery" || label == "Drinks")
                      ? 0
                      : 5,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: _restaurantControllerState.categoryKey == label
                      ? Colors.white
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
