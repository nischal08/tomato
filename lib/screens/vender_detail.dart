import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/widgets/productCard.dart';

class VenderDetail extends StatelessWidget {
  var _theme = Theme.of(Get.context);
  TextTheme _themeData = Theme.of(Get.context).textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            _text(),
            SizedBox(
              height: 30,
            ),
            _venderInfo(),
            SizedBox(
              height: 25,
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
            ProductCard(
              favFood: "Mixed Pizza",
              venderName: "Pepperoni Pizza",
              rating: 4.5,
              assetUrl: 'assets/foods/pizza.png',
              price: 650,
              productFlag: true,
              productPadding: 12,
            ),
        ],
      ),
    );
  }

  _text() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(),
          Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: CustomColors.lightBrown,
          ),
        ],
      ),
    );
  }

  _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Choose what you", style: _themeData.headline3),
        Text("want to eat today", style: _themeData.headline4),
      ],
    );
  }

  Widget _venderInfo() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _theme.cardColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.only(
          left: 15,
          top: 5,
          bottom: 5,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _venderLogo(),
            _venderName(),
            SizedBox(
              width: 55,
            ),
          ],
        ));
  }

  Widget _venderLogo() {
    return SizedBox(
      height: 55,
      width: 55,
      child: Image.asset(
        'assets/venders/bajeko.jpg',
      ),
    );
  }

  Widget _venderName() {
    return Text(
      "Bajeko Sekuwa",
      style: _themeData.headline6,
    );
  }
}
