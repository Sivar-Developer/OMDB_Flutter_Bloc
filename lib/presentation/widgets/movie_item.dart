import 'package:flutter/material.dart';
import 'package:flutter_imdb/constants/colors.dart';
import 'package:flutter_imdb/constants/strings.dart';
import 'package:flutter_imdb/data/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final MovieModel movie;

  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, movieDetailsRoute, arguments: movie),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${movie.title}',
              style: const TextStyle(
                height: 1.3,
                fontSize: 12,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          child: Hero(
            tag: '${movie.imdbId}',
            child: Container(
                color: MyColors.myGrey,
                child: FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: '${movie.poster}',
                  fit: BoxFit.cover,
                )),
          ),
        ),
      ),
    );
  }
}
