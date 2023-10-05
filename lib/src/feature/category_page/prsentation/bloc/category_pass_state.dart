// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_pass_bloc.dart';

abstract class CategoryPassState extends Equatable {}

class CategoryPassInitial extends CategoryPassState {
  @override
  List<Object?> get props => [];
}

class ListenFirabaseState extends CategoryPassState {
  final List<PasswordModel> passwordModel;
  ListenFirabaseState({
    required this.passwordModel,
  });
  @override
  List<Object?> get props => [passwordModel];
}

class DataLoadedSuccessfullyState extends CategoryPassState {
  @override
  List<Object?> get props => [];
}

class ListenDataFirebaseState extends CategoryPassState {
  final List<PasswordModel> passwordModel;
  ListenDataFirebaseState({
    required this.passwordModel,
  });

  @override
  List<Object?> get props => [passwordModel];
}

class LoadingState extends CategoryPassState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends CategoryPassState {
  final Object error;
  ErrorState({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
