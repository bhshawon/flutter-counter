class FormatUtils {
  static String formatDouble(double d) {
    var str = d.toString();
    if (str.contains('.')) {
      var subIndex = str.length - 1;
      while (str[subIndex] == '0') {
        subIndex -= 1;
      }

      if (str[subIndex] == '.') {
        subIndex -= 1;
      }

      return str.substring(0, subIndex + 1);
    }

    return str;
  }
}
