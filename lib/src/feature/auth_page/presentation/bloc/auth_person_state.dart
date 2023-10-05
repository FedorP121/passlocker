// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_person_bloc.dart';

@immutable
abstract class AuthPersonState extends Equatable {}

// стартовые состояния страниц
class StartRegisterState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class StartRecoveryPasswordState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class StartAuthState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}
////////////////////////////////////////////////////////////////////////////////

class AuthWidgetState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class CorrectCodeState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class LoadingRegisterState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class ErrorFirebaseState extends AuthPersonState {
  final Object error;
  ErrorFirebaseState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class LoginFirebaseState extends AuthPersonState {
  final String inLogin;
  LoginFirebaseState({
    required this.inLogin,
  });
  @override
  List<Object?> get props => [inLogin];
}

class ErrorRegisterState extends AuthPersonState {
  final Object error;
  ErrorRegisterState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class RegisterFirebaseState extends AuthPersonState {
  final String register;
  RegisterFirebaseState({
    required this.register,
  });
  @override
  List<Object?> get props => [register];
}

class VericationMailFirebaseState extends AuthPersonState {
  final String verification;
  VericationMailFirebaseState({
    required this.verification,
  });
  @override
  List<Object?> get props => [verification];
}

class SendVerificationMailState extends AuthPersonState {
  final String message;
  SendVerificationMailState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class ErrorSendVerificationMailState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class LoadingSendVerificationMailState extends AuthPersonState {
  @override
  List<Object?> get props => [];
}

class ErrorPaswordState extends AuthPersonState {
  final Object error;
  ErrorPaswordState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class SendPasswordResetEmailState extends AuthPersonState {
  final String message;
  SendPasswordResetEmailState({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class ErrorAuthCheckState extends AuthPersonState {
  final Object error;
  ErrorAuthCheckState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}

class AuthCheckedState extends AuthPersonState {
  final String userID;
  final bool auth;
  AuthCheckedState({
    required this.userID,
    required this.auth,
  });
  @override
  List<Object?> get props => [userID, auth];
}
