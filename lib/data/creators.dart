import 'package:marvel_comics/data/creator.dart';

class Creators {
  int? available;
  List<Creator>? creators;

  Creators({this.available, this.creators});

  Creators.fromJson(Map<String, dynamic> json) {
    available = json["available"];
    if (json["items"] != null) {
      creators = <Creator>[];
      json["items"]
          .forEach((creator) => creators!.add(Creator.fromJson(creator)));
    }
  }
}
