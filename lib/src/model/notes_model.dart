class NotesModel {
  NotesModel({
    required this.id,
    required this.color,
    required this.year,
    required this.month,
    required this.day,
    required this.startHour,
    required this.endHour,
    required this.userId,
    required this.title,
  });

  int id;
  int year;
  int month;
  int day;
  int startHour;
  int endHour;
  int color;
  int userId;
  String title;

  Map<String, dynamic> toJson() => {
        "color": color,
        "month": month,
        "year": year,
        "day": day,
        "start_hour": startHour,
        "end_hour": endHour,
        "user_id": userId,
        "title": title,
      };
}
