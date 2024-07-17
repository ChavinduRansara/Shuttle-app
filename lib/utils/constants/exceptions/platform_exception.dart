class AppPlatformException implements Exception {
  final String code;

  AppPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network-error':
        return 'A network error occurred. Please check your internet connection.';
      case 'permission-denied':
        return 'Permission denied. Please grant the necessary permissions.';
      case 'unavailable':
        return 'The requested service is currently unavailable.';
      case 'timeout':
        return 'The request timed out. Please try again.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'unexpected-error':
        return 'An unexpected error occurred. Please try again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
