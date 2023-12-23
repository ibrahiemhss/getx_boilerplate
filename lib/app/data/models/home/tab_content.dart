import 'package:hive/hive.dart';
part 'tab_content.g.dart';

@HiveType(typeId: 19) // id must be unique
class TabContent {
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;

  TabContent({
    required this.title,
    required this.description,
  });

  bool isExpanded = false;

  factory TabContent.fromJson(Map<dynamic, dynamic> json) => TabContent(
        title: json.containsKey("title") ? json["title"] : null,
        description:
            json.containsKey("description") ? json["description"] : null,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}
