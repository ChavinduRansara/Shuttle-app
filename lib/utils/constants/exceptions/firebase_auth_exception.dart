class AppFirebaseAuthException implements Exception {
  final String code;

  AppFirebaseAuthException(this.code);

  String get message{
    switch (code) {
      case 'email-already-in-use':
        return 'The email is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'Email & Password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'wrong-password':
        return 'The password is invalid or the user does not have a password.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';
      case 'user-disabled':
        return 'The user account has been disabled by an administrator.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed in user.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Log in again before retrying this request.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'provider-already-linked':
        return 'This credential is already associated with a different user account.';
      case 'no-such-provider':
        return 'User was not linked to an account with the given provider.';
      case 'invalid-credential':
        return 'The supplied auth credential is incorrect, malformed or has expired.';
      case 'operation-not-supported-in-this-environment':
        return 'This operation is not supported in the environment this application is running on.';
      case 'popup-closed-by-user':
        return 'The popup has been closed by the user before finalizing the operation.';
      case 'keychain-error':
        return 'An error occurred when accessing the keychain.';
      case 'internal-error':
        return 'An internal error has occurred.';
      case 'invalid-verification-code':
        return 'The SMS verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.';
      case 'invalid-verification-id':
        return 'The verification ID used to create the phone auth credential is invalid.';  
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}