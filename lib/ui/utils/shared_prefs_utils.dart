import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:islami_task/ui/models/sura_model.dart';
import 'package:islami_task/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSurasProvider extends ChangeNotifier {
   List <Sura> mostRecentSuras = [];
   void addSuraIndex(int suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuras = prefs.getStringList("most_recent_suras") ?? [];
    if(mostRecentSuras.contains("$suraIndex"))
      {
        mostRecentSuras.remove("$suraIndex");
        mostRecentSuras.add("$suraIndex");

      }
    else
      {
        mostRecentSuras.add("$suraIndex");
      }
    prefs.setStringList("most_recent_suras", mostRecentSuras.toList());
  }
  Future<void> refreshMostRecentSuras() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasAsString  = (prefs.getStringList("most_recent_suras") ?? []).toList();
    List<Sura> newMostRecentSuras = [];
    for(int i=0 ; i < mostRecentSurasAsString.length ; i++)
      {
        var suraIndex = int.parse(mostRecentSurasAsString[i]);
        newMostRecentSuras.add(Constants.suras[suraIndex]);
      }
    mostRecentSuras = newMostRecentSuras.reversed.toList();
    notifyListeners();
    //return newMostRecentSuras;
  }

}