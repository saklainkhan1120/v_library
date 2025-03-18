
class Course {
  final bool isActive;
  final String id;
  final String courseType;
  final String type;
  final String courseLang;
  final bool autoCreateGroup;
  final bool isPublished;
  final List<Session> sessions;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Price? price;
  final String? frequency;
  final int? numberOfClasses;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;

  Course({
    required this.isActive,
    required this.id,
    required this.courseType,
    required this.type,
    required this.courseLang,
    required this.autoCreateGroup,
    required this.isPublished,
    required this.sessions,
    required this.createdAt,
    required this.updatedAt,
    this.price,
    this.frequency,
    this.numberOfClasses,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      isActive: json["isActive"],
      id: json["_id"],
      courseType: json["courseType"],
      type: json["type"],
      courseLang: json["courselang"],
      autoCreateGroup: json["autoCreateGroup"],
      isPublished: json["isPublished"],
      sessions: (json["sessions"] as List)
          .map((session) => Session.fromJson(session))
          .toList(),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      price: json["price"] != null ? Price.fromJson(json["price"]) : null,
      frequency: json["frequency"],
      numberOfClasses: json["numberOfClasses"],
      startDate: json["startDate"] != null
          ? DateTime.parse(json["startDate"])
          : null,
      endDate:
      json["endDate"] != null ? DateTime.parse(json["endDate"]) : null,
      startTime: json["startTime"],
      endTime: json["endTime"],
    );
  }
}

class Session {
  final String id;
  final DateTime date;
  final String startTime;
  final String endTime;

  Session({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json["_id"],
      date: DateTime.parse(json["date"]),
      startTime: json["startTime"],
      endTime: json["endTime"],
    );
  }
}

class Price {
  final int originalPrice;
  final int discountedPrice;
  final DateTime discountValidUntil;

  Price({
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountValidUntil,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      originalPrice: json["originalPrice"],
      discountedPrice: json["discountedPrice"],
      discountValidUntil: DateTime.parse(json["discountValidUntil"]),
    );
  }
}
