import 'package:marvel_comics/data/creators.dart';
import 'package:marvel_comics/data/thumbnail.dart';

class Comic {
  int? id;
  String? title;
  String? description;
  Thumbnail? thumbnail;
  Creators? creators;

  Comic({this.id, this.title, this.description, this.thumbnail, this.creators});

  Comic.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    if (json["thumbnail"] != null) {
      thumbnail = Thumbnail.fromJson(json["thumbnail"]);
    }
    if (json["creators"] != null) {
      creators = Creators.fromJson(json["creators"]);
    }
  }
}
