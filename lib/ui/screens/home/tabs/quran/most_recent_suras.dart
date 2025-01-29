import 'package:flutter/material.dart';
import 'package:islami_task/ui/utils/app_colors.dart';
import 'package:islami_task/ui/utils/app_styles.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';
import 'package:islami_task/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';

import '../../../../models/sura_model.dart';

class MostRecentSuras extends StatefulWidget {
  const MostRecentSuras({super.key});

  @override
  State<MostRecentSuras> createState() => _MostRecentSurasState();
}

class _MostRecentSurasState extends State<MostRecentSuras> {
  late RecentSurasProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       getMostRecentSuras();

    });
  }
  Future<void> getMostRecentSuras() async{
   await provider.refreshMostRecentSuras();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return provider.mostRecentSuras.isEmpty? Container() :
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Most Recently",style: AppStyle.whiteBold16,textAlign: TextAlign.start),
         Expanded(
           child: ListView.builder(
               itemCount: provider.mostRecentSuras.length,
               scrollDirection: Axis.horizontal,
               itemBuilder: (context,index)
           {
             return buildMostRecentSuraWidget(provider.mostRecentSuras[index]);
           }
           ),
         ),
        ],
      ),
    );
  }

 Widget buildMostRecentSuraWidget(Sura sura)
  {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Row(
        children: [
          Expanded(
            //flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(sura.suraNameEn,style: AppStyle.blackBold24),
                //SizedBox(height: 8,),
                Text(sura.suraNameAr,style: AppStyle.blackBold24),
                //SizedBox(height: 8,)
                Text("${sura.verses} verses",style: AppStyle.blackBold24),
              ],
            ),
          ),
          Image.asset(AppAssets.reading,),
        ],
      ),
    );
  }
}
