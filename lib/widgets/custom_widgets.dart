import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double paddingLeft;
  final double paddingRight;

  var _themeData = Theme.of(Get.context);
  CustomIcon({this.onPressed, this.icon, this.paddingLeft, this.paddingRight});
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: RawMaterialButton(
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: _themeData.cardColor,
        onPressed: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.only(
            left: paddingLeft ?? 0,
            right: paddingRight ?? 0,
          ),
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
