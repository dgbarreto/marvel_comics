import 'dart:async';
import 'dart:convert';

import 'package:marvel_comics/api.dart';
import 'package:marvel_comics/data/comic.dart';
import 'package:marvel_comics/data/response.dart';

class ComicsBloc {
  final StreamController _streamController = StreamController<List<Comic>>();
  final StreamController _scComic = StreamController<Comic>();

  get comics => _streamController.stream;
  get comic => _scComic.stream;

  final List<Comic> _comics = <Comic>[];

  fetchComics({int offset = 0}) async {
    API api = API();
    var output = await api.getComics(offset: offset);
    Response response = Response.fromJson(json.decode(output.body));
    _comics.addAll(response.data?.comics ?? <Comic>[]);
    _streamController.add(_comics);
  }

  setComic(Comic comic) {
    _scComic.add(comic);
  }

  dispose() {
    _streamController.close();
    _scComic.close();
  }
}
