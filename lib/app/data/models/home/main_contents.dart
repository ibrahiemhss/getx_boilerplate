import 'package:hive/hive.dart';
import 'body_home.dart';
part 'main_contents.g.dart';

@HiveType(typeId: 18) // id must be unique
class MainContents {
  @HiveField(1)
  String miniTitle;
  @HiveField(2)
  String title;
  @HiveField(3)
  String description;
  @HiveField(4)
  BodyHome body;

  MainContents({
    required this.miniTitle,
    required this.title,
    required this.description,
    required this.body,
  });

  bool isExpanded = false;

  factory MainContents.fromJson(Map<dynamic, dynamic> json) => MainContents(
        miniTitle: json.containsKey("miniTitle") ? json["miniTitle"] : null,
        title: json.containsKey("title") ? json["title"] : null,
        description:
            json.containsKey("description") ? json["description"] : null,
        body: BodyHome.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "miniTitle": miniTitle,
        "title": title,
        "description": description,
        "body": body.toJson(),
      };
}
