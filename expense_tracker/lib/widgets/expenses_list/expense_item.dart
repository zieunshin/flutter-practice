import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card( 
      child: Padding (padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        //�����۵��� ������ġ�� !
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expense.title, 
            style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              //12.33456 -> 12.33
              const Spacer(),
              //Spacer�� �׻� ���� ������ �� �����ؼ� ������ ������ �о��ִ� ������ �Ѵ�
              Row(
                children: [
                  //�������� ������ ���õǴ� �� 
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate),
                ],
              ),
            ],
          )
        ],
      ), 
      )
      );
  }
}