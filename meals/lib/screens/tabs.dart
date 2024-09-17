import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

//BottomBar ����ϴ� �κ�

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    //�����޼��� �ߴ� �˶�
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text(message),)); 
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    //���ã�� ��� �����ϴ� �Լ� 
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting == true) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer favorite.');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Mark as a favorite!');
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx)=> FiltersScreen(),
      ),
      );
    } else {
      //�����ִ� â �ݱ� (�̹� meals ������ �����ֱ� ������ �̵��� �ʿ� X)
      Navigator.of(context).pop();
      //close the drawer
    }
  }
  
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      //'Favorites' ���� Ȱ��ȭ�Ǵ� ��
      activePage = MealsScreen (
        meals: [],
        onToggleFavorite: _toggleMealFavoriteStatus,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      // drawer�� ������ ������ ��
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      //�ϴܹ� �Լ� ����!!
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // currentIndex�� � tab�� ������ ���� �ڵ����� control ���� (���� index ���̶���Ʈ ���ִ� ��)
        currentIndex: _selectedPageIndex,
        items: const [
          //�ϴܹٿ� �������� 2���� ��ġ�Ѵٴ� �ǹ�
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories' ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label:'Favorites' ),
        ],
      ),
    );
  }
}