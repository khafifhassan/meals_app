import 'package:flutter/material.dart';
import '../Data/CategoryData.dart';
import '../Models/Category.dart';

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
      ),
      children: categoriesdata.map((item) => CategoryTemplate(item)).toList(),
    );
  }
}

class CategoryTemplate extends StatelessWidget {
  // const CategoryTemplate({Key? key}) : super(key: key);
  final Category category;
  CategoryTemplate(this.category);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(
          "/Meals",
          arguments: <String, Object>{
            'id': category.id,
            'title': category.title
          },
        )
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              this.category.color.withOpacity(0.1),
              this.category.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            this.category.title,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
