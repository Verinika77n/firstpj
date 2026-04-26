import 'package:flutter/material.dart';

import 'app.dart';

void main() {
  runApp(CinemaLibraryApp());
}

class _MovieCard extends StatelessWidget {
  const _MovieCard({required this.movie});

  final MovieItem movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF171A2A),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 76,
                height: 96,
                decoration: BoxDecoration(
                  color: movie.color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(Icons.movie_creation_outlined,
                    color: Colors.white, size: 36),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(movie.genre,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 13)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF242842),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded,
                              color: Color(0xFFFFD66B), size: 18),
                          const SizedBox(width: 4),
                          Text(
                            movie.rating,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: movie.sessions
                .map(
                  (time) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF373C58)),
                    ),
                    child: Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _BottomCinemaNavBar extends StatelessWidget {
  const _BottomCinemaNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      decoration: const BoxDecoration(
        color: Color(0xFF131626),
        border: Border(top: BorderSide(color: Color(0xFF222744))),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_rounded, label: 'Главная', selected: true),
          _NavItem(icon: Icons.search_rounded, label: 'Поиск'),
          _NavItem(icon: Icons.confirmation_num_rounded, label: 'Билеты'),
          _NavItem(icon: Icons.favorite_rounded, label: 'Избранное'),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, this.selected = false});

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Color color = selected ? const Color(0xFFFF8E3C) : const Color(0xFF9098BD);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class MovieItem {
  const MovieItem({
    required this.title,
    required this.genre,
    required this.rating,
    required this.color,
    required this.sessions,
  });

  final String title;
  final String genre;
  final String rating;
  final Color color;
  final List<String> sessions;
}
