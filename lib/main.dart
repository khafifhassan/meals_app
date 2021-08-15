import 'package:flutter/material.dart';
import 'package:meals_app/Screens/TabScreen.dart';
import 'Screens/Setting_Screen.dart';
import 'Screens/Meals_Screen.dart';
import 'Screens/Meal_Detail_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals App",
      theme: Theme.of(context).copyWith(
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
          headline3: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          headline4: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: null,
      routes: {
        '/': (context) => TabViewsScreen(),
        '/Setting': (context) => SettingScreen(),
        '/Meals': (context) => MealsScreen(),
        '/MealDetail': (context) => MealDetailScreen(),
      },
    );
  }
}
