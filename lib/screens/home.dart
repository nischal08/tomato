import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tomato/controller/homeController.dart';

class HomePage extends StatelessWidget {
  var _homeControllerState;
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: Color(0xffFCFEFF),
      extendBodyBehindAppBar: true,
      // appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            _userInfo(),
            SizedBox(
              height: 40,
            ),
            _search(),
            SizedBox(
              height: 40,
            ),
            _category(),
            _vender(),
          ],
        ),
      ),
    );
  }

  _userInfo() {
    return Container(
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
            child: Image.network(_homeControllerState.userImgUrl)));
  }

  Widget _greeting() {
    return RichText(
      text: TextSpan(
        text: "Good Morning, ",
        style: TextStyle(
            color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
        children: [
          TextSpan(
            text: "Nischal",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }

  _search() {
    return Container(
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
        Text(
          "Find your",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text("favourite foods",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }

  _searchIcon() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      child: RaisedButton(
        splashColor: Colors.lightBlue.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
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
      width: Get.width * .85,
      height: Get.height * .06,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        for (var key in _homeControllerState.categoryList.keys)
          _eachCategory(
            label: key,
            assetUrl: _homeControllerState.categoryList[key],
          )
      ]),
    );
  }

  Widget _eachCategory(
      {String assetUrl, String label, Function onPressed, int index}) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(assetUrl),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _vender() {
    return Container();
  }
}
