import 'package:hive/hive.dart';
import 'about.dart';
part 'home_data.g.dart';

@HiveType(typeId: 17) // id must be unique
class HomeData {
  @HiveField(1)
  About about;

  HomeData({
    required this.about,
  });

  factory HomeData.fromJson(Map<dynamic, dynamic> json) => HomeData(
        about: About.fromJson(json["about"]),
      );

  Map<String, dynamic> toJson() => {
        "about": about.toJson(),
      };
}
