import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/controller/homeController.dart';

class ProductCard extends StatelessWidget {
  HomeController _homeControllerState;
  var _theme;
  final String favFood;
  final String venderName;
  final double rating;
  final int price;
  final String assetUrl;
  final double productPadding;
  ProductCard({
    this.productPadding,
    this.assetUrl,
    this.favFood,
    this.venderName,
    this.rating,
    this.price,
  });
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(Get.context);
    return _venderCard();
  }

  Widget _venderCard() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: productPadding ?? 10,
        horizontal: 30,
      ),
      padding: EdgeInsets.all(17),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(Get.context).cardColor,
      ),
      child: Row(
        children: [
          _venderLogo(),
          SizedBox(
            width: 35,
          ),
          _venderInfo(),
        ],
      ),
    );
  }

  Widget _venderLogo() {
    return Container(
      child: Image.asset(assetUrl),
    );
  }

  Widget _venderInfo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _rating(),
          SizedBox(
            height: 10,
          ),
          _title(),
          SizedBox(
            height: 10,
          ),
          _type(),
          price != null ? _price() : SizedBox(),
        ],
      ),
    );
  }

  Widget _price() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          child: Text(
            "Rs.${price}",
            style: Theme.of(Get.context).textTheme.caption,
          ),
        ),
      ],
    );
  }

  Widget _rating() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "${rating}",
            style: Theme.of(Get.context).textTheme.overline,
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.star_rounded,
            size: 16,
            color: Colors.amber[300],
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        venderName,
        style: Theme.of(Get.context).textTheme.caption,
      ),
    );
  }

  Widget _type() {
    return Container(
      child: Text(
        favFood,
        style: Theme.of(Get.context).textTheme.button,
      ),
    );
  }
}