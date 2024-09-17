import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function (Expense expense) onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    //플러터에서 제공하는 날짜선택기
    
    final pickedDate = await showDatePicker(
      context: context, 
      initialDate: now, 
      firstDate: firstDate, 
      lastDate: now, 
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: Text('Invalid input'),
        content: const Text('Please make sure a valid title, amount, date and category was entered.'),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(ctx);
          }, 
          child: const Text('Okay'),
          ),
        ],
      ),
      );
      return ;
    }

    widget.onAddExpense(Expense(
      title: _titleController.text, 
      amount: enteredAmount, 
      date: _selectedDate!, 
      category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50, //최대 50글자
            //keyboardType: TextInputType.text : 열었을때 어떤 키보드가 띄워지는지 결정해주는 함수
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(children: [
            Expanded(
            child: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              //사용자들에게 어떤 값을 입력해야 하는지 힌트로 주기 위해서 
              prefixText: '\$ ',   
              label: Text('Amount'),
            ),
          ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Row(
            //행의 끝으로 옮기기
            mainAxisAlignment: MainAxisAlignment.end,
            //수직으로 콘텐츠 정렬하기
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _selectedDate == null 
                ? 'No date Selected' 
                : formatter.format(_selectedDate!),
                ),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(
                  Icons.calendar_month
                  ),
                  ),
            ],
          ),
          ),
          ],),
          const SizedBox(height: 16),
          Row(
            children: [
            DropdownButton(
              value: _selectedCategory,
              items: Category.values.map(
              (category) => DropdownMenuItem(
                value: category,
                child: Text(
                  category.name.toUpperCase(),
                  ),
                ),
              )
              .toList(), 
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            // 버튼 사이에 간격이 있는지 확인하기 위한 스페이서
            const Spacer(),
            TextButton(onPressed: () {
              // pop은 Cancel 누르면 팝업창 사라지게 해줌
              Navigator.pop(context);
            }, child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: _submitExpenseData, 
              child: const Text('saved Expense'),
            ),
          ],),
        ],
      ),
    );
  }
}