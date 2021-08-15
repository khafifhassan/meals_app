import 'package:flutter/material.dart';
import '../Data/CategoryData.dart';
import '../Models/Meal.dart';

class MealsScreen extends StatelessWidget {
  // const MealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        (ModalRoute.of(context)!.settings.arguments as Map<String, Object>);
    final listmeals = mealsdata.where(
      (meal) => meal.categories.contains(args["id"]),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(args["title"].toString()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: listmeals.map((meal) => MealItem(meal)).toList(),
          ),
        ));
  }
}

class MealItem extends StatelessWidget {
  //const MealItem({Key? key}) : super(key: key);
  final Meal meal;
  MealItem(this.meal);

  String get complexitytext {
    switch (this.meal.complexity) {
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Simple:
        return "Simple";
      default:
        return "Not specified";
    }
  }

  String get affordabilitytext {
    switch (this.meal.affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Not specified";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/MealDetail", arguments: {
          'id': this.meal.id,
          'title': this.meal.title,
        });
      },
      child: Container(
        height: 230,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        this.meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 10,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.black45),
                      child: Text(
                        this.meal.title,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse),
                        Text(this.meal.duration.toString(),
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money_rounded),
                        Text(this.affordabilitytext,
                            style: Theme.of(context).textTheme.headline3)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.accessible),
                        Text(this.complexitytext,
                            style: Theme.of(context).textTheme.headline3),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
