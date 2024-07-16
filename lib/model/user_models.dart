class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? status;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        status: json['status'],
      );

  UserModel copywith({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        status: status,
      );
}
