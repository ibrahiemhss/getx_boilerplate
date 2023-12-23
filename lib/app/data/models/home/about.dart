import 'package:hive/hive.dart';
import 'body_home.dart';
import 'main_contents.dart';
part 'about.g.dart';

@HiveType(typeId: 15) // id must be unique
class About {
  @HiveField(1)
  String miniTitle;
  @HiveField(2)
  MainContents mainContents;
  @HiveField(3)
  bool isExpanded = false;

  About({
    required this.miniTitle,
    required this.mainContents,
  });

  factory About.fromJson(Map<dynamic, dynamic> json) => About(
        miniTitle: json.containsKey("miniTitle") ? json["miniTitle"] : null,
        mainContents: json.containsKey("mainContents")
            ? MainContents.fromJson(json["mainContents"])
            : MainContents(
                miniTitle: "",
                title: "",
                description: "",
                body: BodyHome(tabs: [])),
      );

  Map<String, dynamic> toJson() => {
        "miniTitle": miniTitle,
        "mainContents": mainContents.toJson(),
      };
}
