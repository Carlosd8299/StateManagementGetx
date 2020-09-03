import 'package:meta/meta.dart';

class User {
  final int id;
  final String email, firstName, lastName, avatar;

  User({
    @required this.id,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.avatar,
  });

  String get getFirstName => this.firstName;

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      avatar: json["avatar"],
    );
  }
}
