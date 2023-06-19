class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  /// Take the value, then change the value.
  SignInState copyWith({
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email, /// if email is empty, use the initial email which is ""
      password: password ?? this.password
    );
  }
}
