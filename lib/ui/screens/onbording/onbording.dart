import 'package:flutter/material.dart';
import 'package:islami_task/ui/models/onbording_model.dart';
import 'package:islami_task/ui/screens/home/home_screen.dart';
import 'package:islami_task/ui/screens/onbording/dot_indecator_widget.dart';
import 'package:islami_task/ui/screens/onbording/onbording_widget.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_colors.dart';

class OnBordingScreen extends StatefulWidget {
   OnBordingScreen({super.key});
   static const String routeName = "onBordingScreen";

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
   PageController pageController = PageController();

   int currentIndex =0;


   @override
  void initState() {
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt()?? 0;
      setState(() {});
    });
  }

  List<OnBordingModel> onBordingList = [
     OnBordingModel(
         imageUrl: "assets/images/onbording_1.png",
         title: "Welcome To Islmi App",),
     OnBordingModel(
         imageUrl: "assets/images/onbording_2.png",
         title: "Welcome To Islami",
         discription: "We Are Very Excited To Have You In Our Community",),
     OnBordingModel(
         imageUrl: "assets/images/onbording_3.png",
         title: "Reading the Quran",
         discription: "Read, and your Lord is the Most Generous",),
     OnBordingModel(
         imageUrl: "assets/images/onbording_4.png",
         title: "Bearish",
         discription: "Praise the name of your Lord, the Most High",),
     OnBordingModel(
         imageUrl: "assets/images/onbording_5.png",
         title: "Holy Quran Radio",
         discription: "You can listen to the Holy Quran Radio through the application for free and easily",),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Image.asset(AppAssets.logo,height: MediaQuery.of(context).size.height * 0.15 , width: double.infinity),
          ),
          Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) =>
                  OnBordingWidget(
                    onBordingData: onBordingList[index],
                  ),
              itemCount: onBordingList.length,
              ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0 ? (){
                        pageController.animateToPage(
                            currentIndex-1,
                            duration: Duration(
                              milliseconds: 400,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,);
                      } : null,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: AppColors.primary,
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text(currentIndex!=0 ? "Back" : ""),),
                    TextButton(onPressed: (){
                      if(currentIndex ==4 )
                      {
                        onBordingDone();
                      }
                      else
                        {
                          pageController.animateToPage(
                              currentIndex ++,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                    },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.primary,
                          textStyle: TextStyle(fontSize: 16),
                        ) ,
                         child: Text(currentIndex==4 ? "Finish":"Next"),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotIndicatorWidget(isSelected: currentIndex == 0),
                  DotIndicatorWidget(isSelected: currentIndex == 1),
                  DotIndicatorWidget(isSelected: currentIndex == 2),
                  DotIndicatorWidget(isSelected: currentIndex == 3),
                  DotIndicatorWidget(isSelected: currentIndex == 4),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }
  void onBordingDone() async{
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    await prefrences.setBool("firstTime", false);
    Navigator.pushNamed(context, HomesScreen.routeName);
  }
}
