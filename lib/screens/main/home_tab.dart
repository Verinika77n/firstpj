import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/movies_notifier.dart';
import '../../widgets/horizontal_movie_list.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/section_header.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool myMoviesExpanded = true;
  bool downloadsExpanded = true;
  bool favoritesExpanded = false;

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MoviesNotifier>();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppSearchBar(),
            const SizedBox(height: 18),
            const SectionHeader(title: 'Рекомендации'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: movies.recommendations),
            const SizedBox(height: 14),
            const SectionHeader(title: 'Популярно сейчас'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: movies.popularNow),
            const SizedBox(height: 14),
            const SectionHeader(title: 'Американское кино'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: movies.americanCinema),
            const SizedBox(height: 14),
            SectionHeader(
              title: 'Ваши фильмы',
              isCollapsible: true,
              isExpanded: myMoviesExpanded,
              onToggle: () => setState(() => myMoviesExpanded = !myMoviesExpanded),
            ),
            if (myMoviesExpanded) ...[
              const SizedBox(height: 10),
              HorizontalMovieList(movies: movies.myMovies),
            ],
            const SizedBox(height: 14),
            SectionHeader(
              title: 'Скаченное',
              isCollapsible: true,
              isExpanded: downloadsExpanded,
              onToggle: () => setState(() => downloadsExpanded = !downloadsExpanded),
            ),
            if (downloadsExpanded) ...[
              const SizedBox(height: 10),
              HorizontalMovieList(movies: movies.downloadedMovies),
            ],
            const SizedBox(height: 14),
            SectionHeader(
              title: 'Избранное',
              isCollapsible: true,
              isExpanded: favoritesExpanded,
              onToggle: () => setState(() => favoritesExpanded = !favoritesExpanded),
            ),
            if (favoritesExpanded) ...[
              const SizedBox(height: 10),
              HorizontalMovieList(movies: movies.myMovies),
            ],
          ],
        ),
      ),
    );
  }
}
