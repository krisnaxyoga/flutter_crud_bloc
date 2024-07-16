class RegisterModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'phone': phone,
    };
  }
}
