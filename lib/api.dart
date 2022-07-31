import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class API {
  final String _urlBase = "gateway.marvel.com:443";
  final String _apiPublicKey = "881b12acefab33b3a78ba5ad89194653";
  final String _apiPrivateKey = "6056558f156f36badbd77ef1a732ddaabbfbc746";

  Future getComics({int offset = 0}) {
    String timestamp = DateTime.now().toIso8601String();
    Uri uri = Uri.https(_urlBase, "/v1/public/comics", {
      "ts": timestamp,
      "apikey": _apiPublicKey,
      "offset": offset.toString(),
      "hash": _generateHash(timestamp),
    });

    return http.get(uri);
  }

  String _generateHash(String timestamp) {
    String base = timestamp + _apiPrivateKey + _apiPublicKey;
    return md5.convert(utf8.encode(base)).toString();
  }
}
