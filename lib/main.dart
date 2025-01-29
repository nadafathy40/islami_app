import 'package:flutter/material.dart';
import 'package:islami_task/ui/screens/home/home_screen.dart';
import 'package:islami_task/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_task/ui/screens/splash/splash_screen.dart';
import 'package:islami_task/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islami_task/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => RecentSurasProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {

        HomesScreen.routeName : (_) => HomesScreen(),
        SplashScreen.routeName : (_) => SplashScreen(),
        SuraDetails.routeName : (_) => SuraDetails(),
        SebahaTab.routeName : (_) => SebahaTab(),
      },
      initialRoute: HomesScreen.routeName,
    );
  }
}

