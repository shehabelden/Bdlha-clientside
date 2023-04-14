class LoginModel {
  final String name;
  final String password;
  const LoginModel(
      {
        required this.name,
        required this.password,
      }
      );
  Map<String, dynamic> toMap() {
    return{
      'name' : name,
      "gender" : password,
    };
  }
}
