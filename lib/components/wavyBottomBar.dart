import 'package:flutter/material.dart';
import 'wavyClipper.dart';

class WavyBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: ClipPath(
        clipper: WavyClipper(),
        child: Container(
          height: size.height * 0.09,
          width: size.width,
          color: Color(0xFF7ad6fb),
          //0xFFBD97CB Lilac
          //0xFF04D4F0 Turquoise
          padding: EdgeInsets.only(top: 4),
        ),
      ),
    );
  }
}