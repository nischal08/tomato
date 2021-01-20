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
            SizedBox(height: 40,),
            _search(),
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
            child: Image.network(_homeControllerState.url)));
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
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }

  _category() {
    return Container();
  }

  _vender() {
    return Container();
  }
}
