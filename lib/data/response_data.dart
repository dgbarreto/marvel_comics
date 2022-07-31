import 'package:marvel_comics/data/comic.dart';

class ResponseData {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Comic>? comics;

  ResponseData({this.offset, this.limit, this.total, this.count, this.comics});

  ResponseData.fromJson(Map<String, dynamic> json) {
    offset = json["offset"];
    limit = json["limit"];
    total = json["total"];
    count = json["count"];
    comics = <Comic>[];
    if (json["results"] != null) {
      json["results"].forEach((comic) => comics!.add(Comic.fromJson(comic)));
    }
  }
}
