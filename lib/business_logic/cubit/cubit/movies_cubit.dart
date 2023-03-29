// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:flutter_imdb/data/models/movie_model.dart';
import 'package:flutter_imdb/data/respository/movies_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;
  List<MovieModel> movies = [];

  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<MovieModel> getMovies() {
    moviesRepository.getMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });

    return movies;
  }
}
