import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_task/ui/models/sura_details_args.dart';
import 'package:islami_task/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islami_task/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';
import '../../../../models/sura_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_manager.dart';

class SuraNameRow extends StatelessWidget {
  final Sura sura;
  late RecentSurasProvider provider;
  SuraNameRow({super.key,required this.sura});
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return InkWell (
      onTap: () async{
        //todo: save index of this sura to shared pref
        String suraNameAr = sura.suraNameAr ;
        String suraNameEn = sura.suraNameEn;
        String fileName = sura.fileName;
        provider.addSuraIndex(sura.index);
        Navigator.pushNamed(context, SuraDetails.routeName,
        arguments: SuraDetailsArgs(suraNameAr: suraNameAr, suraNameEn: suraNameEn, fileName: fileName)
        );
      },
      child: Row(
        children: [
          buildSuraNumberWhithBg(),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${sura.suraNameEn}",style: TextStyle(color: AppColors.white,fontSize: 20),),
                Text("${sura.verses} verses" , style: TextStyle(color: AppColors.white , fontSize: 20),),
              ],
            ),
          ),
          Text("${sura.suraNameAr}",style: TextStyle(color: AppColors.white,fontSize: 20,),),
        ],
      ),
    );
  }

 Widget buildSuraNumberWhithBg() {
    return  Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppAssets.islamicNumberBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(child: Text("${sura.index}",style: TextStyle(color: AppColors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
    );
 }
}
