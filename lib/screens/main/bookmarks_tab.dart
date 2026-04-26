import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
import '../../providers/movies_notifier.dart';
import '../../widgets/horizontal_movie_list.dart';
import '../../widgets/section_header.dart';

class BookmarksTab extends StatelessWidget {
  const BookmarksTab({super.key});

  void _openMovie(BuildContext context, Movie movie) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Открыт фильм: ${movie.title}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MoviesNotifier>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'Закладки'),
            const SizedBox(height: 10),
            HorizontalMovieList(
              movies: movies.myMovies,
              onMovieTap: (movie) => _openMovie(context, movie),
            ),
          ],
        ),
      ),
    );
  }
}
