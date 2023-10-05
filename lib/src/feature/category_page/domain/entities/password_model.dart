import 'package:equatable/equatable.dart';

class PasswordModel extends Equatable {
  final String userID;
  final String namePassword;
  final String password;
  final String discripcion;
  const PasswordModel({
    required this.userID,
    required this.namePassword,
    required this.password,
    required this.discripcion,
  });

  @override
  List<Object?> get props => [namePassword, password, userID];

  // Конструктор для создания объекта из Map
  factory PasswordModel.fromRealtimeDatabase(Map<String, dynamic> map) {
    return PasswordModel(
      userID: map['user'] as String,
      namePassword: map['namePassword'] as String,
      password: map['password'] as String,
      discripcion: map['discripcion'] as String,
    );
  }

  // Метод для конвертирования объекта в Map
  Map<String, dynamic> toRealtimeDatabase() {
    return {
      'user': userID,
      'namePassword': namePassword,
      'password': password,
      'discripcion': discripcion,
    };
  }
}
