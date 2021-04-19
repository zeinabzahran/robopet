import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:robopet/introPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onOffPage.dart';

SharedPreferences prefs;
void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      color: Colors.blue,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  final controller = PageController(viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }
  Future checkFirstSeen() async {
    prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool('seen') ?? false);
    print("what?" + seen.toString());
    if (seen) {
      new Future.delayed(
          const Duration(seconds: 2),
              () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IntroPage()),
          ));
    }
    else{
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child:
      Image.asset(
        "images/loading.gif",
        height: MediaQuery.of(context).size.height*.2,
        width: MediaQuery.of(context).size.width*.2,
      ),
        ),),
    );
  }
}

