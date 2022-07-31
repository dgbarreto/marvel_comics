import 'package:marvel_comics/data/response_data.dart';

class Response {
  int? code;
  ResponseData? data;

  Response({this.code, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    if (json["data"] != null) {
      data = ResponseData.fromJson(json["data"]);
    }
  }
}
