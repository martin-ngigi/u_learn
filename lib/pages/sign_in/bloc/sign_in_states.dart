class SignInState {
  ///immutable variables. They won't change.
  final String email;
  final String password;

  const SignInState({this.email = "", this.password = ""});

  /// Take the value, then change the value.
  /// We need copyWith because the above variables are immutable.
  SignInState copyWith({ /// optional named parameters. i.e. on can chose to pass any or dont pass at all
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email, /// if email is empty, use the initial email which is ""
      password: password ?? this.password
    );
  }
}
