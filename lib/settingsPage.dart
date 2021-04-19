import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPage extends StatefulWidget {
  final String routeType;
  const SettingsPage ({Key key, this.routeType}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  TextEditingController _petName = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.4),
      body: StaggeredGridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: <Widget>[
       Row(
            children: [
              Container(color: Colors.yellow, width: 100, height: 50,),
              Container(width: 100, height: 50,
              margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF7ad6fb),
                      border: Border.all(
                          color: Color(0xFF7ad6fb)),
                      borderRadius: BorderRadius.all(Radius.circular(80)))
                  // shape: BoxShape.circle,
              ),
          ],),
        Padding(
            padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white60,)
        ),
        Padding(
            padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white54,)
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(color: Colors.white60,)
        ),
        Padding(
            padding: const EdgeInsets.only(right:1.0),
            child: Container(color: Colors.white54,)
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(4, 250.0),
        StaggeredTile.extent(2, 250.0),
        StaggeredTile.extent(2, 250.0),
        StaggeredTile.extent(4, 350.0),
        StaggeredTile.extent(4, 80.0),

      ],
    ),
    );
    // return Container(color: Colors.red,);
  }
}
