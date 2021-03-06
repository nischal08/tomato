import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato/constant/customColor.dart';

class ProductCard extends StatelessWidget {
  final String favFood;
  final String venderName;
  final double rating;
  final int price;
  final String assetUrl;
  final double productPadding;
  final bool addToCartFlag;
  final Color priceColor;
  ProductCard({
    this.priceColor,
    this.productPadding,
    this.assetUrl,
    this.favFood,
    this.venderName,
    this.rating,
    this.price,
    this.addToCartFlag = false,
  });
  @override
  Widget build(BuildContext context) {
    return _venderCard();
  }

  Widget _venderCard() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: productPadding ?? 10,
        horizontal: 30,
      ),
      padding: EdgeInsets.all(addToCartFlag?20:13),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(Get.context).cardColor,
      ),
      child: Row(
        children: [
          _venderLogo(),
          SizedBox(
            width: addToCartFlag?10:35,
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
          addToCartFlag
              ? SizedBox(
                  width: 1,
                )
              : _rating(),
          _title(),
          SizedBox(
            height: price != null ? 8 : 10,
          ),
          _type(),
          price != null
              ? _price()
              : SizedBox(
                  height: 0,
                ),
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
            style: GoogleFonts.openSans(
              fontSize:addToCartFlag?18: 16,
              fontWeight: addToCartFlag?FontWeight.w800:FontWeight.w600,
              color: addToCartFlag?CustomColors.lightRed:Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _rating() {
    return Container(
      child: Column(
        children: [
          Row(
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
          SizedBox(
            height: 10,
          ),
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
