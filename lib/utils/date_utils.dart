class DateUtils {
  static int getUnixTimeStampFromCurrentDate() {
    var now = DateTime.now();
    var date = new DateTime(now.year, now.month, now.day, now.hour);
    return date.millisecondsSinceEpoch;
  }

  static DateTime getDateFromUnixTimeStamp(int timeStamp) {
    return new DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }
}
