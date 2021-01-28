import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tomato/controller/homeController.dart';
import 'package:tomato/widgets/custom_widgets.dart';

class DetailScreen extends StatelessWidget {
  HomeController _homeControllerState;
  TextTheme _textTheme;
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    _textTheme = Theme.of(context).textTheme;
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
            height: 35,
          ),
        ],
      ),
    );
  }

  Widget _ingredient() {
    return SizedBox(
      width: Get.width * .65,
      child: Text(
        "Salami, chilli peppers, tomatoes, oregano, basil",
        textAlign: TextAlign.center,
        style: _textTheme.subtitle2.copyWith(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _titleInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }

  Widget _title() {
    return Text(
      "Pepperoni Pizza",
      style: Theme.of(Get.context).textTheme.headline4,
    );
  }
}
