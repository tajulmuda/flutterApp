import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu/screens/register_view.dart';
import 'package:flutter_app/splashscreen.dart';

import 'menu/corona_home.dart';
import 'menu/dashboard_menu.dart';
import 'getstarted.dart';
import 'menu/login.dart';
import 'menu/menu_promo.dart';
import 'menu/menuboardlogin/registrationcc.dart';
import 'menu/menudashboard/homeboard.dart';
import 'menu/menudashboard/messageboard.dart';
import 'menu/menudashboard/profileboard.dart';
import 'menu/menudashboard/storeboard.dart';
import 'menu/menudashboard/storyboard.dart';

void main() {
  runApp(MyApp(
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Socialfood',
      initialRoute: '/',

      routes: {
        '/': (context) =>getStarted(),

        '/splashscreen': (context) =>SplashScreen(),

        '/menu/login': (context) => Login(),

        '/menu/dashboard_menu': (context) => MyHomePage(),

        '/menu/corona_home': (context) =>MyCorona(),

        '/menu/menu_promo': (context) =>HomePage(),

        '/menu/menuboard/registrationcc': (context) =>Registrationcc(),

        '/menu/menudashboard/homeboard': (context) =>MenuHome(),

        '/menu/menudashboard/messageboard': (context) =>MessageBoard(),

        '/menu/menudashboard/storeboard' : (context) =>StoreBoard(),

        '/menu/menudashboard/storyboard' : (context) =>StoryBoard(),

        '/menu/menudashboard/profileboard' : (context) =>ProfileBoard(),

        '/menu/screens/register_view': (context) => RegisterPage(),
      },
    );
  }
}




