import 'package:flutter/material.dart';
import 'package:flutter_imdb/app_router.dart';

void main() {
  runApp(OmdbApiApp(appRouter: AppRouter()));
}

class OmdbApiApp extends StatelessWidget {
  const OmdbApiApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
