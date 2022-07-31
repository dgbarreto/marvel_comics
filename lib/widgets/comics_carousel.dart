import 'package:flutter/material.dart';
import 'package:marvel_comics/comics_bloc.dart';
import 'package:marvel_comics/data/comic.dart';
import 'package:marvel_comics/data/thumbnail.dart';

class ComicsCarousel extends StatelessWidget {
  const ComicsCarousel(this._comicsBloc);

  final ComicsBloc _comicsBloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 230.0,
      child: StreamBuilder(
        stream: _comicsBloc.comics,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              alignment: Alignment.topCenter,
              child: const CircularProgressIndicator(),
            );
          }

          List<Comic>? data = snapshot.data as List<Comic>?;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(4.0),
            itemCount: data!.length,
            itemBuilder: (context, index) {
              Comic? item = data[index];

              if (index >= (data.length - 1)) {
                _comicsBloc.fetchComics(offset: data.length);
              }

              return GestureDetector(
                onTap: () => _comicsBloc.setComic(item),
                child: Container(
                  width: 180.0,
                  height: 230.0,
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    item.thumbnail!.getUrl(Thumbnail.portraitXlarge),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
