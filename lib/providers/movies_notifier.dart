import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../models/notification.dart';

class MoviesNotifier extends ChangeNotifier {
  final List<Movie> recommendations = const [
    Movie(
      id: '1',
      title: 'Интерстеллар',
      posterUrl: 'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400',
      category: 'Рекомендации',
    ),
    Movie(
      id: '2',
      title: 'Дюна',
      posterUrl: 'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?w=400',
      category: 'Рекомендации',
    ),
    Movie(
      id: '3',
      title: 'Матрица',
      posterUrl: 'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400',
      category: 'Рекомендации',
    ),
  ];

  final List<Movie> popularNow = const [
    Movie(
      id: '4',
      title: 'Оппенгеймер',
      posterUrl: 'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=400',
      category: 'Популярно',
    ),
    Movie(
      id: '5',
      title: 'Барби',
      posterUrl: 'https://images.unsplash.com/photo-1542204165-65bf26472b9b?w=400',
      category: 'Популярно',
    ),
    Movie(
      id: '6',
      title: 'Джокер',
      posterUrl: 'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=400',
      category: 'Популярно',
    ),
  ];

  final List<Movie> americanCinema = const [
    Movie(
      id: '7',
      title: 'Крёстный отец',
      posterUrl: 'https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=400',
      category: 'Американское кино',
    ),
    Movie(
      id: '8',
      title: 'Побег из Шоушенка',
      posterUrl: 'https://images.unsplash.com/photo-1460881680858-30d872d5b530?w=400',
      category: 'Американское кино',
    ),
    Movie(
      id: '9',
      title: 'Бойцовский клуб',
      posterUrl: 'https://images.unsplash.com/photo-1505685296765-3a2736de412f?w=400',
      category: 'Американское кино',
    ),
  ];

  final List<Movie> myMovies = const [
    Movie(
      id: '10',
      title: 'Тёмный рыцарь',
      posterUrl: 'https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400',
      category: 'Ваши фильмы',
    ),
    Movie(
      id: '11',
      title: 'Гладиатор',
      posterUrl: 'https://images.unsplash.com/photo-1616530940355-351fabd9524b?w=400',
      category: 'Ваши фильмы',
    ),
  ];

  final List<Movie> downloadedMovies = const [
    Movie(
      id: '12',
      title: 'Остров проклятых',
      posterUrl: 'https://images.unsplash.com/photo-1543536448-d209d2d13a1c?w=400',
      category: 'Скаченное',
    ),
    Movie(
      id: '13',
      title: 'Начало',
      posterUrl: 'https://images.unsplash.com/photo-1585951237318-9ea5e175b891?w=400',
      category: 'Скаченное',
    ),
  ];

  final List<AppNotification> notifications = const [
    AppNotification(message: 'Вышел фильм «Дюна: Часть вторая»', timeLabel: '2 ч. назад'),
    AppNotification(message: 'Смена пароля подтверждена', timeLabel: '1 д. назад'),
    AppNotification(message: 'Ваш комментарий одобрен', timeLabel: '2 д. назад'),
  ];
}
