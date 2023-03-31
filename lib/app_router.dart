import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_imdb/business_logic/cubit/cubit/movies_cubit.dart';
import 'package:flutter_imdb/constants/strings.dart';
import 'package:flutter_imdb/data/models/movie_model.dart';
import 'package:flutter_imdb/data/respository/movies_repository.dart';
import 'package:flutter_imdb/data/web_services/movies_web_services.dart';
import 'package:flutter_imdb/presentation/screens/movie_details_screen.dart';
import 'package:flutter_imdb/presentation/screens/movies_screen.dart';
import 'package:flutter_imdb/presentation/screens/not_found_screen.dart';

class AppRouter {
  late MoviesRepository moviesRepository;
  late MoviesCubit moviesCubit;

  AppRouter() {
    moviesRepository = MoviesRepository(MoviesWebServices());
    moviesCubit = MoviesCubit(moviesRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case moviesRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      MoviesCubit(moviesRepository),
                  child: const MoviesScreen(),
                ));
      case movieDetailsRoute:
        final movie = settings.arguments as MovieModel;
        return MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(movie: movie));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
