import 'package:bloc/bloc.dart';
import 'package:flutter_imdb/data/models/movie_model.dart';
import 'package:flutter_imdb/data/respository/movies_repository.dart';
import 'package:meta/meta.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MoviesRepository moviesRepository;
  late List<MovieModel> movies;

  MoviesCubit(this.moviesRepository) : super(MoviesInitial());

  List<MovieModel> getMovies() {
    moviesRepository.getMovies().then((movies) {
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });

    return movies;
  }
}
