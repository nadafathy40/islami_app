import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_task/ui/utils/app_colors.dart';
import 'package:islami_task/ui/utils/app_styles.dart';

import '../../../../utils/asset_manager.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.ahadethBg), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Image.asset(AppAssets.logo),
              Expanded(
                child: Container(
                  //color: AppColors.primary,
                  child: CarouselSlider.builder(
                    itemCount: 10,
                    itemBuilder: (context, index, _) {
                      return buildAhadethWidget(index);
                    },
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container buildAhadethWidget(int index)
  {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
     child: Column(
       children: [
         Stack(
           alignment: Alignment.center,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Image.asset(AppAssets.titleBgLeft,color: AppColors.black),
                 Image.asset(AppAssets.titleBgRight,color: AppColors.black,),
               ],
             ),
             Text('ahadeth title',style: AppStyle.blackBold24),
           ],
         ),
         Text("content hadeth",style: AppStyle.blackBold16),
       ],
     ),
    );
  }
}
