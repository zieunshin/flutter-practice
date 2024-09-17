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

    //BuildContext�� context�� �޾ƾ� push ������ context�� ������ �� ����
    Navigator.of(context).push(
      //�ش� ������ ���� �Ļ�ȭ���� push �ϴ� ���
      //��, �ֻ��� ȭ���̱� ������ ����ڵ��� ���� �Ǵ� ȭ���� ��
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onToggleFavorite: onToggleFavorite,
            //filtering �� �Ļ�ȭ���� �̰����� ���޵Ǵ� �� (appBar�� �ش� �޴������� ǥ�õǰ� �ϴ� �ڵ尰����)
          ), 
        ),
    );
    //Navigator.push : ��ũ������ �� ���̾ �о�ִ� �� 
    //Navigator.pop : ���̾� �� �ϳ��� �����ϴ� ��
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold : �Ϲ����� ���߽�ũ�� ���� �� ����ϴ� �⺻ ȭ�� set up ��� 
    return GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        //���η� 2���� �� ���� ��
        children: [
          for (final category in availableCategories) 
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                //�Ļ������� �׸��忡���� ������ �� �ְ� �ϱ� ����
                _selectCategory(context, category);
              },
            ),
        ],
      );
  }
}