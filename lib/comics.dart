import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marvel_comics/comics_bloc.dart';
import 'package:marvel_comics/data/comic.dart';
import 'package:marvel_comics/data/creator.dart';
import 'package:marvel_comics/data/thumbnail.dart';
import 'package:marvel_comics/widgets/comic_details.dart';
import 'package:marvel_comics/widgets/comics_carousel.dart';

class Comics extends StatefulWidget {
  @override
  State<Comics> createState() => _ComicsState();
}

class _ComicsState extends State<Comics> {
  final ComicsBloc _comicsBloc = ComicsBloc();

  @override
  void initState() {
    super.initState();

    _comicsBloc.fetchComics();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: [
          ComicsCarousel(_comicsBloc),
          ComicDetails(_comicsBloc),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _comicsBloc.dispose();
  }
}
