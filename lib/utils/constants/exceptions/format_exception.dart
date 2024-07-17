class AppFormatException implements Exception {
  final String code;

  AppFormatException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'invalid-phone-number':
        return 'The phone number is not valid.';
      case 'invalid-url':
        return 'The URL is not valid.';
      case 'invalid-json':
        return 'The JSON format is not valid.';
      case 'invalid-date':
        return 'The date format is not valid.';
      case 'empty-field':
        return 'This field cannot be empty.';
      case 'invalid-password':
        return 'The password format is not valid.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
