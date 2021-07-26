import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:easyshop/Screens/HomeChilds/CategoriesScreen.dart';
import 'package:easyshop/Screens/HomeChilds/HomeScreen.dart';
import 'package:easyshop/Screens/HomeChilds/MarketingScreen.dart';
import 'package:easyshop/Screens/HomeChilds/OrderScreen.dart';
import 'package:easyshop/Screens/HomeChilds/ProfileScreen.dart';
import 'package:easyshop/Utils/appThemeData.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomNavIndex = 0;

  List<Widget> _children = [
    HomeScreen(),
    CategoryScreen(),
    OrderScreen(),
    MarketingScreen(),
    ProfileScreen()
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.category,
    Icons.add,
    Icons.share,
    Icons.person
  ];

  @override
  Widget build(BuildContext context) {
    final theme = getThemeData(context);
    return SafeArea(
        child: Scaffold(
      body: _children[_bottomNavIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? theme.primaryColor : Colors.grey[500];
          return Icon(
            iconList[index],
            size: isActive ? 38 : 26,
            color: color,
          );
        },
        backgroundColor: theme.backgroundColor,
        activeIndex: _bottomNavIndex,
        splashColor: theme.primaryColor,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    ));
  }
}
