import 'package:flutter/material.dart';
import 'package:meals_app/Data/CategoryData.dart';
import 'package:meals_app/Models/Meal.dart';

class MealDetailScreen extends StatefulWidget {
  //const MealDetailScreen({Key? key}) : super(key: key);

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool isFavorite = false;

  void toggleMeal(Meal meal) {
    setState(() {
      favoritemealsdata.removeWhere((element) => element.id == meal.id);
      if (!isFavorite) {
        favoritemealsdata.add(meal);
      }
      // isFavorite = !isFavorite;
    });
  }

  void checkexistance(String id) {
    setState(() {
      isFavorite =
          favoritemealsdata.where((element) => element.id == id).isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> args =
        (ModalRoute.of(context)!.settings.arguments as Map<String, Object>);
    Meal meal = mealsdata.firstWhere((element) => element.id == args['id']);
    isFavorite =
        favoritemealsdata.where((element) => element.id == meal.id).isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleMeal(meal),
        child: isFavorite ? Icon(Icons.star_rounded) : Icon(Icons.star_border),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber.shade300,
                      child: FittedBox(
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    title: Text(
                      meal.ingredients[index],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                },
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Steps",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Container(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber.shade300,
                      child: FittedBox(
                        child: Text((index + 1).toString()),
                      ),
                    ),
                    title: Text(
                      meal.steps[index],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  );
                },
              ),
              height: MediaQuery.of(context).size.height * 0.35,
            ),
          ],
        ),
      ),
    );
  }
}
