class LoginException implements Exception {
  String message;
  LoginException(this.message);

  @override
  String toString() => message;
}
