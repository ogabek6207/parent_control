int noOfDay() {
  var todayDate = DateTime.now();
  final firstDay = DateTime.utc(2022, DateTime.monday, 1);
  var difference = todayDate.difference(firstDay);
  return difference.inDays + 7;
}
