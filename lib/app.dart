import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'providers/auth_notifier.dart';
import 'providers/movies_notifier.dart';
import 'screens/auth/logged_out_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_step1_screen.dart';
import 'screens/auth/register_step2_screen.dart';
import 'screens/auth/splash_screen.dart';
import 'screens/main/bookmarks_tab.dart';
import 'screens/main/home_tab.dart';
import 'screens/main/main_screen.dart';
import 'screens/notifications/notifications_tab.dart';
import 'screens/profile/profile_tab.dart';
import 'theme/app_theme.dart';

class CinemaLibraryApp extends StatelessWidget {
  CinemaLibraryApp({super.key});

  final AuthNotifier _authNotifier = AuthNotifier();

  late final GoRouter _router = GoRouter(
    initialLocation: '/splash',
    refreshListenable: _authNotifier,
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/logged-out', builder: (_, __) => const LoggedOutScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register/step1', builder: (_, __) => const RegisterStep1Screen()),
      GoRoute(path: '/register/step2', builder: (_, __) => const RegisterStep2Screen()),
      GoRoute(path: '/main', redirect: (_, __) => '/main/home'),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/main/home', builder: (_, __) => const HomeTab()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/main/notifications', builder: (_, __) => const NotificationsTab()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/main/bookmarks', builder: (_, __) => const BookmarksTab()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/main/profile', builder: (_, __) => const ProfileTab()),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthNotifier>.value(value: _authNotifier),
        ChangeNotifierProvider(create: (_) => MoviesNotifier()),
      ],
      child: MaterialApp.router(
        title: 'Кинотекарь',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        routerConfig: _router,
      ),
    );
  }
}
