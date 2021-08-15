import 'package:flutter/material.dart';
import 'Meals_Screen.dart';
import '../Data/CategoryData.dart';

class FavoritesScreen extends StatelessWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: favoritemealsdata.length > 0
          ? Column(
              children: favoritemealsdata.map((e) => MealItem(e)).toList(),
            )
          : Center(
              child: Text(
                "Try to add some favorite meals",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
    );
  }
}
