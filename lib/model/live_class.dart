class LiveClass {
  final String id;
  final String startDate;
  final String endDate;
  final List<Session> sessions;

  LiveClass({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.sessions,
  });

  factory LiveClass.fromJson(Map<String, dynamic> json) {
    return LiveClass(
      id: json["_id"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      sessions: (json["sessions"] as List).map((session) => Session.fromJson(session)).toList(),
    );
  }
}

class Session {
  final String date;
  final String startTime;
  final String endTime;

  Session({required this.date, required this.startTime, required this.endTime});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      date: json["date"],
      startTime: json["startTime"],
      endTime: json["endTime"],
    );
  }
}
