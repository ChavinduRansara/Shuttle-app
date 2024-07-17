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
        return 'This operation is not allowed. Please contact support.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-not-found':
        return 'There is no user record corresponding to this identifier. The user may have been deleted.';
      case 'wrong-password':
        return 'The password is invalid. Please try again.';
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
        return 'This account is already linked with another user account with the same provider.';
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
      case 'quota-exceeded':
        return 'The SMS quota for the project has been exceeded.';
      case 'email-already-exists':
        return 'The email is already exists. Please use another email.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new one.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please request a new one.';
      case 'missing-action-code':
        return 'The action code is missing. Please request a new one.';
      case 'user-token-expired':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'user-token-revoked':
        return 'The user\'s credential has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the email.';
      case 'missing-iframe-start':
        return 'The email template is missing the start of an iframe.';
      case 'missing-iframe-end':
        return 'The email template is missing the end of an iframe.';
      case 'missing-iframe-src':
        return 'The email template is missing the src of an iframe.';
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for action code verification link.';
      case 'missing-app-credential':
        return 'The phone verification request is missing an application verifier assertion. A reCAPTCHA response token needs to be provided.';
      case 'invalid-app-credential':
        return 'The phone verification request contains an invalid application verifier assertion.';
      case 'session-cookie-expired':
        return 'The session cookie has expired. Please log in again.';
      case 'uid-already-exists':
        return 'The provided uid is already in use by an existing user. Please use a different one.';
      case 'invalid-cordova-configuration':
        return 'The following Cordova plugins must be installed to enable OAuth sign-in: cordova-plugin-buildinfo, cordova-universal-links-plugin, cordova-plugin-browsertab, cordova-plugin-inappbrowser and cordova-plugin-customurlscheme.';
      case 'app-deleted':
        return 'The database connection was deleted. Please try again.';
      case 'user-token-mismatch':
        return 'The user\'s credential is no longer valid. The user must sign in again.';
      case 'web-storage-unsupported':
        return 'This browser is not supported or 3rd party cookies and data may be disabled.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication with the provided API key. Review your key configuration in the Google API console.';
      case 'INVALID_LOGIN_CREDENTIAL':
        return 'The email or password is incorrect. Please try again.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}