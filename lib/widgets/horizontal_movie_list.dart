import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'movie_card.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({
    super.key,
    required this.movies,
    this.onMovieTap,
  });

  final List<Movie> movies;
  final ValueChanged<Movie>? onMovieTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: EdgeInsets.only(right: index == movies.length - 1 ? 0 : 10),
            child: MovieCard(
              movie: movie,
              onTap: () => onMovieTap?.call(movie),
            ),
          );
        },
      ),
    );
  }
}
