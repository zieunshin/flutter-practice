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
        //아이템들을 시작위치로 !
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
              //Spacer는 항상 남은 공간을 다 차지해서 내용을 옆으로 밀어주는 역할을 한다
              Row(
                children: [
                  //동적으로 아이콘 선택되는 것 
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