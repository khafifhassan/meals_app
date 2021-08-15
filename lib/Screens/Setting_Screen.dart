import 'package:flutter/material.dart';
import 'package:meals_app/Data/CategoryData.dart';
import '../Models/Meal.dart';

class SettingScreen extends StatefulWidget {
  //const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

List<Meal> mealsdatasave = [];

class _SettingScreenState extends State<SettingScreen> {
  bool isGlutenFree = settings["isGlutenFree"] as bool;
  bool isLactoseFree = settings["isLactoseFree"] as bool;
  bool isVegan = settings["isVegan"] as bool;
  bool isVegetarian = settings["isVegetarian"] as bool;
  @override
  void initState() {
    super.initState();
    if (mealsdatasave.length < mealsdata.length) mealsdatasave = mealsdata;
  }

  void activatefilter() {
    setState(() {
      mealsdata = mealsdatasave;
      if (!(settings["isGlutenFree"] as bool) &&
          !(settings["isLactoseFree"] as bool) &&
          !(settings["isVegan"] as bool) &&
          !(settings["isVegetarian"] as bool)) {
        return;
      }

      mealsdata = mealsdata.where((meal) {
        if ((settings["isGlutenFree"] as bool) && !meal.isGlutenFree) {
          return false;
        }
        if ((settings["isLactoseFree"] as bool) && !meal.isLactoseFree) {
          return false;
        }
        if ((settings["isVegan"] as bool) && !meal.isVegan) {
          return false;
        }
        if ((settings["isVegetarian"] as bool) && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      print('***/ ' + mealsdata.length.toString() + ' /***');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SwitchListTile(
            value: isGlutenFree,
            onChanged: (value) {
              setState(() {
                isGlutenFree = value;
                settings['isGlutenFree'] = value;
                activatefilter();
              });
            },
            title: Text("Gluten Free",
                style: Theme.of(context).textTheme.headline4),
            subtitle: Text("Des/Activate the filtre for Gluten Free",
                style: Theme.of(context).textTheme.headline4),
          ),
          SwitchListTile(
            value: isLactoseFree,
            onChanged: (value) {
              setState(() {
                isLactoseFree = value;
                settings['isLactoseFree'] = value;
                activatefilter();
              });
            },
            title: Text("Lactose Free",
                style: Theme.of(context).textTheme.headline4),
            subtitle: Text("Des/Activate the filtre for Lactose Free",
                style: Theme.of(context).textTheme.headline4),
          ),
          SwitchListTile(
            value: isVegan,
            onChanged: (value) {
              setState(() {
                isVegan = value;
                settings['isVegan'] = value;
                activatefilter();
              });
            },
            title: Text("Gluten Free",
                style: Theme.of(context).textTheme.headline4),
            subtitle: Text("Des/Activate the filtre for Vegan",
                style: Theme.of(context).textTheme.headline4),
          ),
          SwitchListTile(
            value: isVegetarian,
            onChanged: (value) {
              setState(() {
                isVegetarian = value;
                settings['isVegetarian'] = value;
                activatefilter();
              });
            },
            title: Text("Vegetarian",
                style: Theme.of(context).textTheme.headline4),
            subtitle: Text("Des/Activate the filtre for Vegetarian",
                style: Theme.of(context).textTheme.headline4),
          ),
        ],
      ),
    );
  }
}
