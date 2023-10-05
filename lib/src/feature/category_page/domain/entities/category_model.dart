import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String userID;
  final String nameCategory;

  const CategoryModel({
    required this.userID,
    required this.nameCategory,
  });

  @override
  List<Object?> get props => [nameCategory, userID];

  // Конструктор для создания объекта из Map
  factory CategoryModel.fromRealtimeDatabase(Map<String, dynamic> map) {
    return CategoryModel(
      userID: map['user'] as String,
      nameCategory: map['namePassword'] as String,
    );
  }

  // Метод для конвертирования объекта в Map
  Map<String, dynamic> toRealtimeDatabase() {
    return {
      'user': userID,
      'namePassword': nameCategory,
    };
  }
}
