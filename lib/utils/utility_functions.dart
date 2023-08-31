class UtilityFunctions {
  static String calculateAge(DateTime birthdate) {
    final now = DateTime.now();
    final age = now.year - birthdate.year;

    if (now.month < birthdate.month ||
        (now.month == birthdate.month && now.day < birthdate.day)) {
      return '${age - 1} yo';
    }

    return '$age yo';
  }

  static String redactString(String input) {
    const maxLength = 22;

    if (input.length <= maxLength) {
      return input;
    }

    final redactedText = input.substring(0, maxLength);
    return '$redactedText...';
  }
}
