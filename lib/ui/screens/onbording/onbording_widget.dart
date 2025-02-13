import 'package:flutter/material.dart';
import 'package:islami_task/ui/utils/app_styles.dart';

import '../../models/onbording_model.dart';

class OnBordingWidget extends StatelessWidget {
 final OnBordingModel onBordingData;
  OnBordingWidget({super.key,required this.onBordingData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(onBordingData.imageUrl),
          ),
          const SizedBox(height: 24,),
          Text(onBordingData.title,style: AppStyle.primaryBold24,),
          const SizedBox(height: 24,),
          if(onBordingData.discription !=null)
              Text(
                textAlign: TextAlign.center,
                onBordingData.discription!,style: AppStyle.primaryBold20),

        ],
      ),
    );
  }
}
