import 'package:intl/intl.dart';

class CustomDate {
  String formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final dateFormat = DateFormat('MMM d, h:mm a');
    final noDateFormat = DateFormat('h:mm a');

    if (date.isAfter(today)) {
      return 'Today, ${noDateFormat.format(date)}';
    } else if (date.isAfter(yesterday)) {
      return 'Yesterday, ${noDateFormat.format(date)}';
    } else {
      return dateFormat.format(date);
    }
  }
}
