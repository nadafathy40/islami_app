import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_task/ui/models/sura_details_args.dart';
import 'package:islami_task/ui/utils/app_colors.dart';
import 'package:islami_task/ui/utils/asset_manager.dart';
import 'package:islami_task/ui/utils/shared_prefs_utils.dart';
import 'package:provider/provider.dart';
import '../../utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = "";
  late RecentSurasProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    SuraDetailsArgs arg = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) getSuraContent(arg.fileName);
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: Text(arg.suraNameEn,style:AppStyle.primaryBold20),
        backgroundColor: AppColors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(child: Text(arg.suraNameAr, style: AppStyle.primaryBold24,)),
          suraContent.isEmpty ? Expanded(child: Center(child: CircularProgressIndicator()))
         : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(child: Text(suraContent,textAlign: TextAlign.center,style: AppStyle.primaryBold20,textDirection: TextDirection.rtl)),
            ),
          ),
          Image.asset(AppAssets.suraContentBg),
        ],
      ),
    );
  }
  Future getSuraContent(String fileName) async{
    Future <String> future = rootBundle.loadString("assets/files/$fileName");
    suraContent = await future;
    setState(() {});
    List <String> suraLines = suraContent.trim().split("\n");
    for(int i=0 ; i < suraLines.length ; i++)
      {
        suraLines[i] += "[$i] ";
      }
    suraContent=suraLines.join();
  }

  @override
  void dispose() {
    provider.refreshMostRecentSuras();
  }
}
