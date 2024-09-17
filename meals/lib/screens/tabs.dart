import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';

//BottomBar 사용하는 부분

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
    //정보메세지 뜨는 알람
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: 
        Text(message),)); 
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    //즐겨찾기 기능 수행하는 함수 
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
      //열려있는 창 닫기 (이미 meals 영역에 들어와있기 때문에 이동할 필요 X)
      Navigator.of(context).pop();
      //close the drawer
    }
  }
  
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      //'Favorites' 탭이 활성화되는 것
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
      // drawer는 옆으로 나오는 탭
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      //하단바 함수 등장!!
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        // currentIndex는 어떤 tab이 강조된 건지 자동으로 control 해줌 (탭한 index 하이라이트 해주는 것)
        currentIndex: _selectedPageIndex,
        items: const [
          //하단바에 아이콘이 2개가 위치한다는 의미
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories' ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label:'Favorites' ),
        ],
      ),
    );
  }
}