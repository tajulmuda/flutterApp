import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu/login.dart';
import 'package:flutter_app/menu/menudashboard/profileboard.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'menudashboard/homeboard.dart';
import 'menudashboard/messageboard.dart';
import 'menudashboard/storeboard.dart';
import 'menudashboard/storyboard.dart';


// IMAGES
var meatImage = 'https://i.ibb.co/5FRwHtB/unnamed.jpg';
var foodImage = 'https://i.ibb.co/qk6PzDy/London-broil.jpg';

var burgerImage = "assets/image/USA_food.jpg";
var chickenImage = 'https://images.unsplash.com/photo-1532550907401-a500c9a57435?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80';

// COLORS
var textYellow = Color(0xFFf6c24d);
var iconYellow = Color(0xFFf4bf47);

var green = Color(0xFF4caf6a);
var greenLight = Color(0xFFd8ebde);

var red = Color(0xFFf36169);
var redLight = Color(0xFFf2dcdf);

var blue = Color(0xFF398bcf);
var blueLight = Color(0xFFc1dbee);

var orange = Color(0xFFffa500);
var yellowLight = Color(0xFFffff9f);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  int _selectedTabIndex = 0;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final _Listpage = <Widget>[
      MenuHome(),
      StoryBoard(),
      ProfileBoard(),
      MessageBoard(),
      StoreBoard()
    ];

    final _salomonBottomBarItems = <SalomonBottomBarItem>[
      SalomonBottomBarItem(
        icon: const Icon(Icons.fastfood),
        title: const Text("HOME"),
        selectedColor: Colors.pink,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.wine_bar_sharp),
        title: const Text("Destination"),
        selectedColor: Colors.orange,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.account_box),
        title: const Text("Profile"),
        selectedColor: Colors.purple,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.messenger),
        title: const Text("Messanger"),
        selectedColor: Colors.cyan,
      ),
      SalomonBottomBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: const Text("Cart"),
        selectedColor: Colors.green,
      ),
    ];

    final _bottomNavBar = SalomonBottomBar(
      items: _salomonBottomBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: _onNavBarTapped,

    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Social Food"),
        centerTitle: true,
      ),
      body: Center(
          child: _Listpage[_selectedTabIndex]
      ),
      bottomNavigationBar: _bottomNavBar,
    );
  }

}