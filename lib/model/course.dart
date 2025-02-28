class CreateCourseModel {
  final String courseType;
  final String type;
  final String courselang;
  final bool autoCreateGroup;

  CreateCourseModel({
    required this.courseType,
    required this.type,
    required this.courselang,
    required this.autoCreateGroup,
  });

  Map<String, dynamic> toJson() {
    return {
      "courseType": courseType,
      "type": type,
      "courselang": courselang,
      "autoCreateGroup": autoCreateGroup,
    };
  }
}
