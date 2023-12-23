// To parse this JSON data, do
//
//     final mainData = mainDataFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import '../home/home_data.dart';
part 'main_data.g.dart';
MainData mainDataFromJson(String str) => MainData.fromJson(json.decode(str));

String mainDataToJson(MainData data) => json.encode(data.toJson());

@HiveType(typeId: 2) // id must be unique
class MainData {
  @HiveField(0)
  late final HomeData homeData;

  MainData({
    required this.homeData,
  });

  factory MainData.fromJson(Map<dynamic, dynamic> json) => MainData(
    homeData: HomeData.fromJson(json["homeData"]),
  );

  Map<String, dynamic> toJson() => {
    "homeData": homeData.toJson(),
  };
}