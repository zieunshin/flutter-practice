//카테고리 grid에 들어가는 아이템들을 위한 내용들
import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key, 
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function () onSelectCategory;

  @override
  Widget build(BuildContext context) {
    // Container 위젯은 위젯의 배경색상을 설정하는데 많은 옵션 제공함

    //inkWell은 감지 위젯도 포함된 속성으로서, 뭔가 더 있어보이는 터치기능 구현
    return InkWell(
      //InkWell이 tap될 때마다 해당 카테고리가 눌려지는 동작 작동
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        //child 설정이유: Container의 하위 매개변수 설정으로 Container 안에 놓이게 될 위젯이다
        child: Text(
          category.title, 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
    );
  }
}