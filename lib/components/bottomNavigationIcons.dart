import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robopet/indexController.dart';
import '../navigationBloc.dart';
import 'bottomIcons.dart';
import 'package:get/get.dart';
// var bottomNavigationBarItemIndex = "1".obs;
class BottomNavigationIcons extends StatefulWidget {
  @override
  _BottomNavigationIconsState createState() => _BottomNavigationIconsState();
}

class _BottomNavigationIconsState extends State<BottomNavigationIcons> {


  @override
  Widget build(BuildContext context) {
    final IndexController indexController=Get.put(IndexController());
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: size.width * 0.02,
      right: size.width * 0.02,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomIcon(
            onPressed: (){
              setState(() {
                Get.find<IndexController>().setIndexValue(0);
              });
            },
            bottomIcons: indexController.bottomNavigationBarItemIndex.toString()=="0"? true : false,
            icons: Icons.settings,
            text: "الإعدادات",
          ),
          BottomIcon(
            onPressed: (){
              setState(() {
                Get.find<IndexController>().setIndexValue(1);

              });
            },
            bottomIcons: indexController.bottomNavigationBarItemIndex.toString()=="1"? true : false,
            icons: Icons.camera_alt,
            text: "بث مباشر",
          ),
          BottomIcon(
            onPressed: (){
              setState(() {
                Get.find<IndexController>().setIndexValue(2);

              });
            },
            bottomIcons: indexController.bottomNavigationBarItemIndex.toString()=="2"? true : false,
            icons: Icons.insights,
            text: "تتبع الوجبات",
          ),
        ],
      ),
    );
  }
}