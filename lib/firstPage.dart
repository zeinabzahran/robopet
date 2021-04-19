import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robopet/indexController.dart';
import 'package:robopet/navigationLayout.dart';
import 'package:robopet/settingsPage.dart';
import 'insightsTab.dart';
import 'components/bottomIcons.dart';
import 'components/bottomNavigationIcons.dart';
import 'components/wavyBottomBar.dart';
import 'navigationBloc.dart';
import 'package:get/get.dart';

class FirstPage extends StatefulWidget with NavigationStates{

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  double screenWidth=0.0, screenHeight=0.0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // print(bottomNavigationBarItemIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    screenHeight=MediaQuery.of(context).size.height;
    screenWidth=MediaQuery.of(context).size.width;
    final IndexController indexController=Get.put(IndexController());
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],

      // backgroundColor: Colors.white,
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            // Column(children:[
            Obx(() =>(
          indexController.bottomNavigationBarItemIndex.toString()=="0"?SettingsPage():
          indexController.bottomNavigationBarItemIndex.toString()=="1"? Padding(
              padding:EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*.04, 0, 0),
              child: _buildVideoWidget(screenWidth,screenHeight)):
          indexController.bottomNavigationBarItemIndex.toString()=="2"?InsightsTab():
              SizedBox(width: 0,height: 0,))),
            // ],
            // ),
            WavyBottomBar(),
            // NavigationLayout()
            BottomNavigationIcons(),
          ],
        ),
      ),
    );
  }
}
Widget _buildVideoWidget(double w, double h){

  return Stack(
    children: [
      Container(color:Colors.white.withOpacity(.4), height: 800,),
      _buildControlPad(w,h),
  //     Container(
  //       // child: JoystickView(),
  //     ),
    ],
  );
}
Widget _buildControlPad(double w, double h){
  return Stack(
    children: [
      Positioned(
          bottom: h*.163,
          right: w*.63,
          child: Container(
            width: w*.355,
            height: h*.172,
            decoration: BoxDecoration(
          color: Color(0xFF7ad6fb),
          border: Border.all(
              color: Color(0xFF7ad6fb)),
          borderRadius: BorderRadius.all(Radius.circular(80))),
      )),
      Positioned(
        bottom:h*.2 ,
        right:w*.65,
          child:BottomIcon(
                onPressed: (){
                  print("Upp");
                },
                bottomIcons: false,
                icons: Icons.keyboard_arrow_up,
                text: "",
              ),
      ),
      Positioned(
        bottom:h*.1 ,
        right:w*.65,
          child:BottomIcon(
            onPressed: (){
              print("Down");
            },
            bottomIcons: false,
            icons: Icons.keyboard_arrow_down,
            text: "",
          ),
        ),

      Positioned(
        bottom:h*.15 ,
        right:w*.75,
          child:BottomIcon(
            onPressed: (){
              print("Left");
            },
            bottomIcons: false,
            icons: Icons.keyboard_arrow_left,
            text: "",
          ),
        ),

      Positioned(
        bottom:h*.15 ,
        right:w*.55,
          child:BottomIcon(
            onPressed: (){
              print("Right");
            },
            bottomIcons: false,
            icons: Icons.keyboard_arrow_right,
            text: "",
          ),

      ),
    // Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //   BottomIcon(
    //
    //     onPressed: (){
    //     },
    //     bottomIcons: true,
    //     icons: Icons.keyboard_arrow_up,
    //     text: "",
    //   ),
    // ],),
    // Row(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   children: [
    //   BottomIcon(
    //     onPressed: (){
    //     },
    //     bottomIcons: true,
    //     icons: Icons.keyboard_arrow_left,
    //     text: "",
    //   ), BottomIcon(
    //     onPressed: (){
    //     },
    //     bottomIcons: true,
    //     icons: Icons.circle,
    //     text: "",
    //   ), BottomIcon(
    //     onPressed: (){
    //       print("jt");
    //     },
    //     bottomIcons: true,
    //     icons: Icons.keyboard_arrow_right,
    //     text: "",
    //   ),
    // ],),
    // Row(children: [
    //   BottomIcon(
    //     onPressed: (){
    //     },
    //     bottomIcons: true,
    //     icons: Icons.keyboard_arrow_down,
    //     text: "",
    //   ),
    // ],)
  ],);
}
