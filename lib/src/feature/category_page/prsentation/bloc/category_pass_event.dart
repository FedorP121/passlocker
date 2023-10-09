part of 'category_pass_bloc.dart';

abstract class CategoryPassEvent extends Equatable {}

class WriteNewPasswordEvent extends CategoryPassEvent {
  final PasswordModel passwordModel;
  WriteNewPasswordEvent({
    required this.passwordModel,
  });

  @override
  List<Object?> get props => [passwordModel];
}

class ListenDataFirebaseEvent extends CategoryPassEvent {
  final String userID;
  ListenDataFirebaseEvent({
    required this.userID,
  });
  @override
  List<Object?> get props => [userID];
}

class WriteNewCategoryEvent extends CategoryPassEvent {
  final CategoryModel categoryModel;
  WriteNewCategoryEvent({
    required this.categoryModel,
  });

  @override
  List<Object?> get props => [categoryModel];
}
