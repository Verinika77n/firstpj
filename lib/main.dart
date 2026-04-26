import 'package:flutter/material.dart';

void main() {
  runApp(const CinemaApp());
}

class CinemaApp extends StatelessWidget {
  const CinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Кинотеатр',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0D0F1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFF8E3C),
          secondary: Color(0xFF8A5BFF),
          surface: Color(0xFF171A2A),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 28,
          ),
          titleLarge: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFC9CEE8),
          ),
        ),
      ),
      home: const CinemaHomePage(),
    );
  }
}

class CinemaHomePage extends StatelessWidget {
  const CinemaHomePage({super.key});

  static const List<MovieItem> movies = [
    MovieItem(
      title: 'Дюна: Часть вторая',
      genre: 'Фантастика · 166 мин',
      rating: '8.6',
      color: Color(0xFF4A395A),
      sessions: ['11:40', '14:20', '18:00', '21:15'],
    ),
    MovieItem(
      title: 'Интерстеллар',
      genre: 'Научная фантастика · 169 мин',
      rating: '8.9',
      color: Color(0xFF234B66),
      sessions: ['10:20', '13:15', '17:40', '20:50'],
    ),
    MovieItem(
      title: 'Человек-паук: Через вселенные',
      genre: 'Анимация · 140 мин',
      rating: '8.5',
      color: Color(0xFF80304D),
      sessions: ['09:50', '12:30', '16:05', '19:45'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const _BottomCinemaNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _TopBar(),
              const SizedBox(height: 26),
              Text(
                'Сегодня в кино',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Выберите фильм и удобный сеанс',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 22),
              const _PromoBanner(),
              const SizedBox(height: 24),
              Text(
                'Афиша',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 14),
              ...movies.map(
                (movie) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _MovieCard(movie: movie),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF181C2E),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(Icons.menu_rounded, color: Colors.white),
        ),
        const Spacer(),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Кинотеатр Orion',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Москва',
              style: TextStyle(color: Color(0xFFC0C6E4), fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFF2B3050),
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF8A5BFF), Color(0xFFFF8E3C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Скидка 20%\nна вечерние сеансы',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Только до воскресенья',
                  style: TextStyle(color: Color(0xFFF9E8DC)),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Icon(Icons.local_movies_rounded, color: Colors.white, size: 46),
        ],
      ),
    );
  }
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
