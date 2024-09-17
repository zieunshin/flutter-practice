import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

//해당음식 클릭하면 뜨도록 하는 것
class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen ({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          //즐겨찾기 버튼 
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            }, 
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.network(  
          meal.imageUrl,
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
          //이미지가 distroy 되지 않도록 fit 하게 맞추는 것
          ),
          const SizedBox(height: 14),
          Text('Ingredients', 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(height: 14),
          for (final ingredient in meal.ingredients)
            Text(ingredient,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
            ),),
            const SizedBox(height: 24),
            Text('Steps',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            ),),
          const SizedBox(height: 14),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              child: Text(step,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              ),),
            ),
        ],),
      ), 
    );
  }
}