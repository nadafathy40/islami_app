import 'package:flutter/material.dart';
import 'package:islami_task/ui/screens/home/home_screen.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),()
    {
      Navigator.pushNamed(context, HomesScreen.routeName);
    }
    );
    return Scaffold(
      body: Image.asset(AppAssets.splash,
      width: double.infinity,height: double.infinity,fit: BoxFit.fill,
      ),
    );
  }
}
