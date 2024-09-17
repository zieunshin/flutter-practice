import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/tabs.dart';
//Ŕ§żĄ ĆÄŔĎżĄ CategoriesScreen() ŔĚ Á¤ŔÇľÇžî ŔÖąâ šŽżĄ importÇŘÁŘ °Í


//ÇŘ´ç žŰżĄ ŔĎ°üľČ ˝şĹ¸ŔĎŔť ÁŚ°ř
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  //ĆůĆŽ Á¤ŔÇ
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  //build ¸ŢźŇľĺ´Â Ŕ§ÁŹŔÇ UI¸Ś ą×¸Žąâ Ŕ§ÇŘ ČŁĂâľÇ´Â ¸ŢźŇľĺŔÓ
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      // homeŔş žŰŔĚ ˝ĂŔŰľÉ ś§ ĂłŔ˝Ŕ¸ˇÎ ÇĽ˝ĂľÇ´Â Č­¸éŔť Á¤ŔÇÇĎ´Â şÎşĐ
      //CategoriesScreenŔĚ ĂĘąâ Č­¸éŔÎ °Í
      home: const TabsScreen(),

    );
  }
}