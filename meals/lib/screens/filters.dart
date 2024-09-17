import 'package:flutter/material.dart';
// import 'package:meals/widgets/main_drawer.dart';
// import 'package:meals/screens/tabs.dart';  

enum Filter {
  glutenFree;
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen ({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState(); 
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (indentifier) {
      //   Navigator.of(context).pop();
      //   if (indentifier == 'meals') {
      //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> TabsScreen(),),);
      //   }
      // },),
      body: WillPopScope(
        onWillPop: () async{
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet
          });
          return false;
        },
        child: Column(children: [
          // 플러터에서 제공하는 스위치 버튼
          SwitchListTile(
            value:_glutenFreeFilterSet, 
            onChanged: (isChecked) {
              _glutenFreeFilterSet = isChecked;
            }, 
            title: Text('Gluten-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            subtitle: Text('Only include gluten-free meals.',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: const EdgeInsets.only(left: 43, right: 22),
          ),
        ],),
      ),
    );
  }
}