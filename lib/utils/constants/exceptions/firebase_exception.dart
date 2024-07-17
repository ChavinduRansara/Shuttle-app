class AppFirebaseException implements Exception {
  final String code;

  AppFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'user-not-found':
        return 'There is no user corresponding to this email.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        return 'Email and password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'network-request-failed':
        return 'A network error occurred. Please try again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'invalid-credential':
        return 'The provided credential is invalid.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
