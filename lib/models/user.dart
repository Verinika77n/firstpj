class AppUser {
  const AppUser({
    required this.name,
    required this.email,
    this.watchHours = 0,
    this.favoritesCount = 0,
  });

  final String name;
  final String email;
  final int watchHours;
  final int favoritesCount;
}
