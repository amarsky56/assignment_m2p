import 'package:intl/intl.dart';

import '../res/strings.dart';

class DateUtil {
  static String formatDate(DateTime dateTimeData) {
    final todayFormat = DateFormat('yyyy-MM-dd');

    DateTime dateTime;

    try {
      dateTime = todayFormat.parse(dateTimeData.toString());
    } catch (e) {
      return 'Invalid date';
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    if (dateTime.isAtSameMomentAs(today)) {
      return Strings.today;
    } else if (dateTime.isAtSameMomentAs(tomorrow)) {
      return Strings.tomorrow;
    } else {
      return todayFormat.format(dateTime);
    }
  }
}
