class RegisterStates {
  /// immutable objects -> can't change. i.e. use const, and final
  final String userName;
  final String email;
  final String password;
  final String rePassword;

  /// constructor
  /// when we use {}, it becomes optional named parameters
  const RegisterStates({
    this.userName="", this.email="", this.password="", this.rePassword=""}); /// if you dont pass any values. Then the constructor will use ""

  /// This will help to change above values since above are immutable. Now copywith is mutable
  RegisterStates copyWith(
      {String? userName, String? email, String? password, String? rePassword}) {
    return RegisterStates(
        userName: userName ?? this.userName,/// if username exist, use username, else use this.username = ""
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
