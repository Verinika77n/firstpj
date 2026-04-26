import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/movie.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Movie> _filterMovies(List<Movie> source) {
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) {
      return source;
    }
    return source.where((movie) => movie.title.toLowerCase().contains(query)).toList();
  }

  void _openMovie(Movie movie) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFF1A1A2E),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text('Категория: ${movie.category}', style: const TextStyle(color: Color(0xFFB6B6CC))),
            const SizedBox(height: 12),
            const Text('Карточка фильма нажата. Здесь можно открыть детали фильма.'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final movies = context.watch<MoviesNotifier>();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSearchBar(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              onFilterTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Фильтры будут доступны в следующей версии')),
              ),
            ),
            const SizedBox(height: 18),
            const SectionHeader(title: 'Рекомендации'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: _filterMovies(movies.recommendations), onMovieTap: _openMovie),
            const SizedBox(height: 14),
            const SectionHeader(title: 'Популярно сейчас'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: _filterMovies(movies.popularNow), onMovieTap: _openMovie),
            const SizedBox(height: 14),
            const SectionHeader(title: 'Американское кино'),
            const SizedBox(height: 10),
            HorizontalMovieList(movies: _filterMovies(movies.americanCinema), onMovieTap: _openMovie),
            const SizedBox(height: 14),
            SectionHeader(
              title: 'Ваши фильмы',
              isCollapsible: true,
              isExpanded: myMoviesExpanded,
              onToggle: () => setState(() => myMoviesExpanded = !myMoviesExpanded),
            ),
            if (myMoviesExpanded) ...[
              const SizedBox(height: 10),
              HorizontalMovieList(movies: _filterMovies(movies.myMovies), onMovieTap: _openMovie),
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
              HorizontalMovieList(movies: _filterMovies(movies.downloadedMovies), onMovieTap: _openMovie),
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
              HorizontalMovieList(movies: _filterMovies(movies.myMovies), onMovieTap: _openMovie),
            ],
          ],
        ),
      ),
    );
  }
}
