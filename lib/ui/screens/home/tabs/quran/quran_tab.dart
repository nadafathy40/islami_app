import 'package:flutter/material.dart';
import 'package:islami_task/ui/models/sura_model.dart';
import 'package:islami_task/ui/screens/home/tabs/quran/sura_name_row.dart';
import 'package:islami_task/ui/utils/app_colors.dart';
import 'package:islami_task/ui/utils/app_styles.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';
import 'package:islami_task/ui/utils/constants.dart';

import 'most_recent_suras.dart';

class QuranTab extends StatefulWidget {

  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String userText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.mainBackground,),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.logo),
              buildSearchTextFiled(),
              SizedBox(height: 10,),
              MostRecentSuras(),

              Text("Sura List",textAlign: TextAlign.start,style: AppStyle.whiteBold16),
              buildSuraListView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSuraListView() {
   List <Sura> filteredSuras = [];
    filteredSuras = Constants.suras.where((sura){
      return sura.suraNameAr.contains(userText) || sura.suraNameEn.toLowerCase().contains(userText.toLowerCase());
    }).toList();
   return Expanded(
     //flex: 2,
      child: ListView.separated(itemBuilder: (context,index)
          {
            return SuraNameRow(sura: filteredSuras[index],);
          },
          itemCount: filteredSuras.length,
        separatorBuilder: (context,index) => Divider(color: AppColors.white),
      ),
    );
 }
  Widget buildSearchTextFiled() {
    OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(10),
    );
    return TextField(
      onChanged: (string){
          userText = string;
          setState(() {});
      },
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        prefixIcon:Image.asset(AppAssets.icSearch),
        enabledBorder: border,
        disabledBorder: border,
        focusedBorder: border,
        hintText: "Sura Name",
        hintStyle: TextStyle(color: AppColors.white ,fontSize: 16),
      ),
      style: TextStyle(color: AppColors.white ,fontSize: 16),
    );
  }

}

