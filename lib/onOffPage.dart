import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:robopet/introPage.dart';

import 'firstPage.dart';


class OnOffPage extends StatefulWidget {
  @override
  OnOffPageState createState() => OnOffPageState();
}

class OnOffPageState extends State<OnOffPage> {
  bool val1 = true;
  String imgPath;
  bool onOff=false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    imgPath='images/off.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('هل اشتقت لحيوانك الأليف؟',
              style: TextStyle(fontSize: 16),
              textDirection: TextDirection.rtl,),
              Text('قم بتشغيل الروبوبيت الخاص بك لرؤيك حيوانك',
                style: TextStyle(fontSize: 16),
                textDirection: TextDirection.rtl,),
              SizedBox(height: MediaQuery.of(context).size.height*.05,),
              InkWell(
                onTap: () {
                  setState(() {
                    onOff=!onOff;
                  });
                  if(onOff==true){
                    imgPath='images/on.png';
                    Future.delayed(
                        const Duration(seconds: 1),
                            () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FirstPage()),
                        ));
                  }
                  else
                    imgPath='images/off.png';
                },
                child: Image.asset(imgPath,
                width: MediaQuery.of(context).size.width*.4,
                height: MediaQuery.of(context).size.height*.25,),
              )
            ]
        ),
      ),
    );
  }
}

