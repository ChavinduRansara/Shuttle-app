class AppFormatException implements Exception {
  final String message;

  const AppFormatException([this.message = 'An error occurred. Please try again.']);

  factory AppFormatException.fromMessage(String message) {
    return AppFormatException(message);
  }

  String get formattedMessage => message;

  factory AppFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const AppFormatException('The email address is not valid. Please enter a valid email address.');
      case 'invalid-phone-number-format':
        return const AppFormatException('The phone number is not valid. Please enter a valid phone number.');
      case 'invalid-date-format':
        return const AppFormatException('The date is not valid. Please enter a valid date.');
      case 'invalid-time-format':
        return const AppFormatException('The time is not valid. Please enter a valid time.');
      case 'invalid-url-format':
        return const AppFormatException('The URL is not valid. Please enter a valid URL.');
      case 'invalid-numeric-format':
        return const AppFormatException('The number is not valid. Please enter a valid number.');
      default:
        return const AppFormatException();
    }
  }
}
