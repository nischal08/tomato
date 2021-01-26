import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato/controller/homeController.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var _homeControllerState;
  @override
  Widget build(BuildContext context) {
    _homeControllerState = Provider.of<HomeController>(context);
    return Scaffold(
      backgroundColor: Color(0xF9FCFEFF),
      extendBodyBehindAppBar: true,
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
          for (int i = 0; i < 8; i++) _venderCard(),
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
      child: FlatButton(
        splashColor: Colors.lightBlue.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xffFFFFFF),
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
        for (var key in _homeControllerState.categoryList.keys)
          _eachCategory(
            label: key,
            assetUrl: _homeControllerState.categoryList[key],
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
        _homeControllerState.onClickCategory(currentKey: label);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _homeControllerState.categoryKey == label
              ? Colors.red[400]
              : Colors.white,
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
                  color: _homeControllerState.categoryKey == label
                      ? Colors.white
                      : Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _venderCard() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      padding: EdgeInsets.all(20),
      height: 140,
      decoration: BoxDecoration(
        // boxShadow: [kBoxShadow],
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      child: Image.asset('assets/venders/bajeko.jpg'),
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
        ],
      ),
    );
  }

  Widget _rating() {
    return Container(
      child: Row(
        children: [
          Text(
            "4.5",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.star_rounded,
            size: 18,
            color: Colors.amber[300],
          )
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(
        "Bajeko Sekuwa",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _type() {
    return Container(
      child: Text(
        "Sekuwa",
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
