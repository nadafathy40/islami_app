import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_task/ui/utils/app_colors.dart';

import '../../../../utils/asset_manager.dart';

class SebahaTab extends StatefulWidget {
  static const String routeName = "sebhaScreen";

  SebahaTab({super.key});

  @override
  State<SebahaTab> createState() => _SebahaTabState();
}

class _SebahaTabState extends State<SebahaTab> {
  List  <String> tasbeh = ["سبحان الله","الله اكبر","الحمدلله"];
   late String tasbehTitle = tasbeh[0];
   double angle = 0;
  int counter = 0 ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.sebhaBg),fit: BoxFit.cover),
        ),
       child: Container(
         decoration: BoxDecoration(
           gradient: LinearGradient(
              colors:  [
                 AppColors.black.withOpacity(0.7),
                 AppColors.black.withOpacity(0.8),
                 AppColors.black,
               ],
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
           ),
         ),
         child: Column(
           children: [
             Image.asset(AppAssets.logo,
              // height: MediaQuery.of(context).size.height *0.15,)
             ),
             Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",
             style: TextStyle(
               fontSize: 48,
               fontWeight: FontWeight.bold,
               color: AppColors.white,
             ),
             ),
             Expanded(
               child: Stack(
                 alignment: Alignment.topCenter,
                 children: [
                   Row(),
                   Padding(
                     padding: const EdgeInsets.only(left: 70),
                     child: Image.asset(AppAssets.sebhaHead,
                       height: MediaQuery.of(context).size.height * .14,alignment: Alignment.centerLeft),
                   ),
                   Positioned.fill(
                     top: MediaQuery.of(context).size.height * .03,
                       child: Stack(
                         children: [
                           AnimatedRotation(
                             duration: Duration(milliseconds: 500),
                             turns: angle,
                             child: InkWell(
                               onTap: ()
                                 {
                                   refreshTasbeh();
                                 },
                               child: Image.asset(
                                 AppAssets.sebhaBody ,
                                 width: double.infinity,
                                 fit: BoxFit.fill,
                               ),
                             ),
                           ),
                         ],
                       ),
                   ),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                     Text(tasbehTitle,style: TextStyle(color: AppColors.white,fontSize: 36 ,fontWeight: FontWeight.bold),),
                       Text("$counter",style: TextStyle(color: AppColors.white,fontSize: 36 ,fontWeight: FontWeight.bold),)
                     ],
                   ),
                 ],
               ),
             ),

           ],
         ),
       ),
      ),
    );
  }
  void refreshTasbeh()
  {
    counter++;
    angle+=(pi/60);
    if(counter == 34)
      {
        tasbehTitle = tasbeh[(tasbeh.indexOf(tasbehTitle) + 1) %3];
        counter = 0;
      }
    setState(() {});
  }
}
