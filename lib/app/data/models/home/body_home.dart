import 'package:hive/hive.dart';
import 'package:getx_boilerplate/app/data/models/home/tab_item.dart';
part 'body_home.g.dart';

@HiveType(typeId: 16) // id must be unique
class BodyHome {
  @HiveField(1)
  List<TabItem> tabs;

  BodyHome({
    required this.tabs,
  });

  factory BodyHome.fromJson(Map<dynamic, dynamic> json) => BodyHome(
        tabs: !json.containsKey("tabs")
            ? []
            : json["tabs"] == null
                ? []
                : List<TabItem>.from(
                    json["tabs"]!.map((x) => TabItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tabs": List<dynamic>.from(tabs.map((x) => x.toJson())),
      };
}
