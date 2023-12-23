import 'package:hive/hive.dart';
import 'package:getx_boilerplate/app/data/models/home/tab_content.dart';
part 'tab_item.g.dart';

@HiveType(typeId: 20) // id must be unique
class TabItem {
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  List<TabContent>? contents;
  @HiveField(4)
  String? summary;

  TabItem({
    required this.title,
    required this.description,
    this.contents,
    this.summary,
  });

  bool isExpanded = false;

  factory TabItem.fromJson(Map<dynamic, dynamic> json) => TabItem(
        title: json.containsKey("title") ? json["title"] : null,
        description:
            json.containsKey("description") ? json["description"] : null,
        summary: json.containsKey("summary") ? json["summary"] : null,
        contents: !json.containsKey("contents")
            ? []
            : json["contents"] == null
                ? []
                : List<TabContent>.from(
                    json["contents"]!.map((x) => TabContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toJson())),
        "summary": summary,
      };
}
