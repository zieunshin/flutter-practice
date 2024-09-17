import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';


class MealsScreen extends StatelessWidget {
  const MealsScreen ({
    super.key,
    this.title,
    required this.meals,
    required this.onToggleFavorite,
  });

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
      builder: (ctx)=> MealDetailsScreen(
        meal: meal,
        onToggleFavorite: onToggleFavorite,
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemBuilder: (ctx, index)=> Text(
          meals[index].title,
        ),
      );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),

            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            )
          ],
        ),
      );
    }
      if (meals.isNotEmpty) {
        content = ListView.builder(
          itemCount: meals.length,
          //한가지 식품 (meal.item) 이 클릭되면 MealdetailsScreen으로 이동하도록 하기
          itemBuilder: (ctx, index)=> MealItem(
            meal: meals[index], 
            onSelectMeal: (context,meal) {
              selectMeal(context, meal);
            },
          ),
        );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        //해당 카테코리 클릭했을 때 카테고리 이름이 앱 바에 뜨도록 한 것
      ),
      //ListView 는 scroll이 가능한 목록 보기임
      body: content ,
    );
  }
}