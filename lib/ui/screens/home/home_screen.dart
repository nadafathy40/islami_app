import 'package:flutter/material.dart';
import 'package:islami_task/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_task/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_task/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_task/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_task/ui/screens/home/tabs/times/times_tab.dart';
import 'package:islami_task/ui/utils/app_colors.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';

class HomesScreen extends StatefulWidget {
  static const String routeName = "homeScreen";
  HomesScreen({super.key});
  @override
  State<HomesScreen> createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen> {

  int currentTabIndex = 3;
  List <Widget> tabs = [QuranTab(),AhadethTab(),RadioTab(),SebahaTab(),TimesTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(),
      body: tabs[currentTabIndex],
    );
  }

  Widget buildBottomNavigationBar()
  {
    return Theme(
      data:  ThemeData(canvasColor: AppColors.primary),
      child: BottomNavigationBar(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        onTap: (clickedIndex){
          currentTabIndex = clickedIndex;
          setState(() {});
        },
        currentIndex: currentTabIndex,
        items:
      [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSearch)),label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: "Ahadeth"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "Radio"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icPray)),label: "Times"),
      ],
      ),
    );
  }
}
