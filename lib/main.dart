import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tomato/controller/OrderController.dart';
import 'package:tomato/controller/productDetailController.dart';
import 'package:tomato/controller/vendersController.dart';
import 'package:tomato/screens/home.dart';

import 'controller/homeController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => VendersController(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductDetailController(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderController(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Tomato',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonColor: Color(0xffE31C1B),
          scaffoldBackgroundColor: Color(0xF9FCFEFF),
          splashColor: Color(0xFFA4D4F0),
          cardColor: Colors.white,
          textTheme: TextTheme(
          
            overline: GoogleFonts.raleway(
              color: Colors.grey,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
            caption: GoogleFonts.raleway(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              letterSpacing: 0.5,
            ),
            button: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 14,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400,
            ),
            subtitle1: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5,
            ),
            subtitle2: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
            headline5: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w300,
            ),
            headline6: GoogleFonts.raleway(
              fontSize: 20,
              letterSpacing: 0.5,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            headline4: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w500,
            ),
            headline3: GoogleFonts.raleway(
              fontSize: 22,
              letterSpacing: 0.5,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        home: Home(),
      ),
    );
  }
}
