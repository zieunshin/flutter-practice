import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
    .where((meal) =>meal.categories.contains(category.id))
    .toList();

    //BuildContext로 context를 받아야 push 값으로 context를 전달할 수 있음
    Navigator.of(context).push(
      //해당 페이지 위에 식사화면을 push 하는 방법
      //즉, 최상위 화면이기 때문에 사용자들이 보게 되는 화면인 것
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onToggleFavorite: onToggleFavorite,
            //filtering 된 식사화면이 이곳으로 전달되는 것 (appBar에 해당 메뉴종류가 표시되게 하는 코드같은뎅)
          ), 
        ),
    );
    //Navigator.push : 스크린에서 새 레이어를 밀어넣는 것 
    //Navigator.pop : 레이어 중 하나를 제거하는 것
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold : 일반적인 다중스크린 제작 시 사용하는 기본 화면 set up 방식 
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        //가로로 2개의 열 만든 것
        children: [
          for (final category in availableCategories) 
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                //식사종류을 그리드에서도 보여질 수 있게 하기 위해
                _selectCategory(context, category);
              },
            ),
        ],
      );
  }
}