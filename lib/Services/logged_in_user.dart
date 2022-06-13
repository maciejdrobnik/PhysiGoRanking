class LoggedInUser {
  final String name;
  final num totalPoints;
  final dynamic weeklyPlace;
  final String sharedId;
  final int dailyPoints;
  final int weeklyPoints;

  const LoggedInUser({
    required this.name,
    required this.totalPoints,
    required this.weeklyPlace,
    required this.sharedId,
    required this.dailyPoints,
    required this.weeklyPoints,
  });

  factory LoggedInUser.fromMap(Map<String, dynamic> map) {
    return LoggedInUser(
      name: map["name"],
      totalPoints: map["total_points"],
      weeklyPlace: map["weekly_place"],
      sharedId: map["shared_id"],
      dailyPoints: map["daily_points"],
      weeklyPoints: map["weekly_points"],
    );
  }
}
