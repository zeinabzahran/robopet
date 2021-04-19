// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:robopet/components/bottomNavigationIcons.dart';
// import 'navigationBloc.dart';
// import 'firstPage.dart';
//
// class NavigationLayout extends StatefulWidget {
//   @override
//   _NavigationLayoutState createState() => _NavigationLayoutState();
// }
// class _NavigationLayoutState extends State<NavigationLayout> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initial();
//   }
//
//   void initial() async {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider<NavigationBloc>(
//         create: (context) => NavigationBloc(),
//         child: Stack(
//           children: <Widget>[
//             BlocBuilder<NavigationBloc, NavigationStates>(
//               builder: (context, navigationState) {
//                 return navigationState as Widget;
//               },
//             ),
//             // mapPage(),
//             Directionality(
//               textDirection: TextDirection.ltr,
//               child: BottomNavigationIcons(),
//             ),
//             // Navigation(),
//           ],
//         ),
//       ),
//     );
//   }
// }