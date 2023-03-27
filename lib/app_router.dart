import 'package:flutter/material.dart';
import 'package:flutter_imdb/constants/strings.dart';
import 'package:flutter_imdb/presentation/screens/movie_details_screen.dart';
import 'package:flutter_imdb/presentation/screens/movies_screen.dart';
import 'package:flutter_imdb/presentation/screens/not_found_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case moviesRoute:
        return MaterialPageRoute(builder: (_) => const MoviesScreen());
      case movieDetailsRoute:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
