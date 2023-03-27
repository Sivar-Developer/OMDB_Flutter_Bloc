import 'package:flutter_imdb/data/models/movie_model.dart';
import 'package:flutter_imdb/data/web_services/movies_web_services.dart';

class MoviesRepository {
  final MoviesWebServices moviesWebServices;

  MoviesRepository(this.moviesWebServices);

  Future<List<dynamic>> getMovies() async {
    final movies = await moviesWebServices.getMovies();

    return movies.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
