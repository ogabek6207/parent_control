class NotesModel {
  NotesModel({
    required this.id,
    required this.color,
    required this.year,
    required this.month,
    required this.day,
    required this.start_hour,
    required this.start_minute,
    required this.end_hour,
    required this.end_minute,
    required this.user_id,
    required this.title,
  });

  int id;
  int year;
  int month;
  int day;
  int start_hour;
  int start_minute;
  int end_hour;
  int end_minute;
  int color;
  int user_id;
  String title;

  Map<String, dynamic> toJson() => {
        "color": color,
        "month": month,
        "year": year,
        "day": day,
        "start_hour": start_hour,
        "start_minute": start_minute,
        "end_hour": end_hour,
        "end_minute": end_minute,
        "user_id": user_id,
        "title": title,
      };
}
