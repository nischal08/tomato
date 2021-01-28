import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tomato/constant/customColor.dart';
import 'package:tomato/controller/productDetailController.dart';
import 'package:tomato/widgets/custom_widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailController _productDetailContrState;
  var _theme;
  @override
  Widget build(BuildContext context) {
    _productDetailContrState = Provider.of<ProductDetailController>(context);
    _theme = Theme.of(context);
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          _titleInfo(),
          SizedBox(
            height: 25,
          ),
          _ingredient(),
          SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              _productInfo(),
              Positioned(
                right: -80,
                child: Container(
                  height: 320,
                  child: Image.asset('assets/foods/pizza.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _productInfo() {
    return Container(
      padding: EdgeInsets.only(
        left: 30.0,
      ),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _price(650),
          SizedBox(
            height: 40.0,
          ),
          _eachProductInfo(
            key: "Calories",
            value: "750 Calories",
          ),
          SizedBox(
            height: 30.0,
          ),
          _eachProductInfo(
            key: "Weight",
            value: "450 gm",
          ),
          SizedBox(
            height: 30.0,
          ),
          _eachProductInfo(
            key: "Delivery",
            value: "45 min",
          ),
          SizedBox(
            height: 30.0,
          ),
          _productSizes(),
        ],
      ),
    );
  }

  Widget _productSizes() {
    return Row(
      children: [
        for (String each in _productDetailContrState.productSizeList)
          _eachProductSize(
            label: each,
            onPressed: _productDetailContrState.onProductSizeClick(
              _productDetailContrState.productSizeList.indexOf(each),
            ),
          ),
      ],
    );
  }

  Widget _eachProductSize({
    IconData icon,
    String label,
    Function onPressed,
  }) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 40,
        width: 40,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _productDetailContrState.productSizeList[
                      _productDetailContrState.currentProductSize] ==
                  label
              ? CustomColors.lightRed
              : _theme.cardColor,
        ),
        child: icon != null
            ? Icon(icon)
            : Text(
                label,
                style: GoogleFonts.raleway(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color:
                        // _restaurantControllerState.categoryKey == label
                        //     ? Colors.white:
                        Colors.white),
              ),
      ),
    );
  }

  Widget _eachProductInfo({
    String key,
    String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.black87.withOpacity(0.7),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          value,
          style: GoogleFonts.raleway(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _price(int price) {
    return Text(
      "Rs.${price}",
      style: GoogleFonts.b612(
        fontWeight: FontWeight.w800,
        fontSize: 24,
      ),
    );
  }

  Widget _ingredient() {
    return SizedBox(
      width: Get.width * .65,
      child: Text(
        "Salami, chilli peppers, tomatoes, oregano, basil",
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          fontWeight: FontWeight.w500,
          fontSize: 17.5,
          color: Colors.black87.withOpacity(0.7),
        ),
      ),
    );
  }

  Widget _titleInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon(
            paddingLeft: 9,
            icon: Icons.arrow_back_ios,
          ),
          _title(),
          CustomIcon(
            icon: Icons.shopping_bag_outlined,
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Text(
      "Pepperoni Pizza",
      style: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
