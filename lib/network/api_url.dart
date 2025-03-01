class ApiUrl {

  static String apiDomain = "https://api.vlibrary.in";
  static String getLiveCourse = "$apiDomain/api/live-course/live-classes";
  static String createCourse = "$apiDomain/api/live-course/live-class";

  static String addClassSchedule(String id) {
    return "$apiDomain/api/live-course/live-class/$id/schedule";
  }


}