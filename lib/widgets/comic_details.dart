import 'package:flutter/material.dart';
import 'package:marvel_comics/comics_bloc.dart';
import 'package:marvel_comics/data/comic.dart';
import 'package:marvel_comics/data/creator.dart';

class ComicDetails extends StatelessWidget {
  const ComicDetails(this._comicsBloc);

  final ComicsBloc _comicsBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _comicsBloc.comic,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        Comic comic = snapshot.data as Comic;

        return Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: Text(
                  comic.title ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: Text(
                  comic.description ?? "",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 4.0,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: comic.creators!.creators!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    Creator creator = comic.creators!.creators![index];

                    return ListTile(
                      title: Text(
                        creator.name ?? "",
                      ),
                      subtitle: Text(
                        creator.role ?? "",
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
