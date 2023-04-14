class SignUpModel {
  final String name;
  final String email;
  final String password1;
  final String password;
  const SignUpModel(
      {
        required this.name,
        required this.email,
        required this.password,
        required this.password1,

      }
      );
  Map<String, dynamic> toMap() {
    return{
      'name' : name,
      "email":email,
      "password" : password,
      "password1": password1,
    };
  }
}
