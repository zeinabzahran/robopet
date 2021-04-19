import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'main.dart';
import 'onOffPage.dart';

class IntroPage extends StatefulWidget {
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  final controller = PageController(viewportFraction: 1);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height*.6,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                controller: controller,
                children:[
                    Column(
                      children:[
                        Padding(
                          padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.1,0,0,0),
                          child: Image.asset('images/food.gif',         //////////
                                fit: BoxFit.contain,
                           ),
                      ),
                        Text('هل تضطر أحيانًا للخروج وترك حيوانك الأليف في المنزل لوحده؟', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),)
                      ],
                    ),
                  Column(
                    children:[
                      Padding(
                        padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.1,0,0,0),
                        child: Image.asset('images/food.gif',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text('هل أنت قلق من أن يشعر حيوانك الصغير بالجوع في غيابك؟', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  Column(
                    children:[
                      Padding(
                        padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.1,0,0,0),
                        child: Image.asset('images/food.gif',       /////////////
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text('هل تود معرفة ما يفعله حيوانك في غيابك؟', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  Column(
                    children:[
                      Padding(
                        padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*.1,0,0,0),
                        child: Image.asset('images/food.gif', ///////////
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text('!إليك الحل, ابدأ الأن', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),)
                    ],
                  ),
                  OnOffPage(),
                ],
              ),
            ),
          ),
          Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*.95, left: MediaQuery.of(context).size.width*.35,),
            child:   SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: SlideEffect(
                  spacing: 8.0,
                  radius: 100.0,
                  dotWidth: 20.0,
                  dotHeight: 20.0,
                  dotColor: Color(0xFF7ad6fb),
                  paintStyle: PaintingStyle.fill,
                  strokeWidth: 2,
                  activeDotColor: Colors.grey),
            ),
          ),
        ],)
    );
  }
}
