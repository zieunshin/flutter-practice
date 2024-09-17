//ī�װ� grid�� ���� �����۵��� ���� �����
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
    // Container ������ ������ �������� �����ϴµ� ���� �ɼ� ������

    //inkWell�� ���� ������ ���Ե� �Ӽ����μ�, ���� �� �־�̴� ��ġ��� ����
    return InkWell(
      //InkWell�� tap�� ������ �ش� ī�װ��� �������� ���� �۵�
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
        //child ��������: Container�� ���� �Ű����� �������� Container �ȿ� ���̰� �� �����̴�
        child: Text(
          category.title, 
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground),
          ),
        ),
    );
  }
}