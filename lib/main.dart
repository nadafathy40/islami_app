import 'package:flutter/material.dart';
import 'package:islami_task/ui/screens/home/home_screen.dart';
import 'package:islami_task/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_task/ui/screens/onbording/onbording.dart';
import 'package:islami_task/ui/screens/splash/splash_screen.dart';
import 'package:islami_task/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islami_task/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  var isFirstTime = await checkFirstTime();
  runApp(ChangeNotifierProvider(
      create: (_) => RecentSurasProvider(),
      child:  MyApp(firstTime: isFirstTime,),
  ),
  );
}
Future<bool> checkFirstTime() async
{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var firstTime = preferences.getBool("firstTime")??true;
  return firstTime;
}
class MyApp extends StatelessWidget {
  final bool firstTime;
  const MyApp({required this.firstTime,super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: firstTime ? OnBordingScreen.routeName : HomesScreen.routeName,
      routes: {
        SplashScreen.routeName : (_) => SplashScreen(),
        OnBordingScreen.routeName : (_) => OnBordingScreen(),
        HomesScreen.routeName : (_) => HomesScreen(),
        SuraDetails.routeName : (_) => SuraDetails(),
        SebahaTab.routeName : (_) => SebahaTab(),
      },

    );
  }
}

