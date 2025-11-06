import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/favourite_job.dart';

List<FavouriteJob> favJobList = [];

enum ThemeType { light, dark }

Future<void> saveFavList(String key, List<FavouriteJob> favList) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String> values = favList
      .map((item) => jsonEncode(item.toJson()))
      .toList();
  await prefs.setStringList(key, values);
}

Future<List<FavouriteJob>?> retriveFavList(String key) async {
  final prefs = await SharedPreferences.getInstance();
  final List<String>? list = prefs.getStringList(key);
  return list
      ?.map(
        (jsonString) => FavouriteJob.fromJson(
          jsonDecode(jsonString) as Map<String, dynamic>,
        ),
      )
      .toList();
}
