// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_person_bloc.dart';

@immutable
abstract class AuthPersonEvent extends Equatable {}

class RegisterWidgetEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class MailConfirmationEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class CorrectCodeEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class LoginInAcountEvent extends AuthPersonEvent {
  final String mail;
  final String password;
  LoginInAcountEvent({
    required this.mail,
    required this.password,
  });
  @override
  List<Object?> get props => [mail, password];
}

class RegisterNewAcountEvent extends AuthPersonEvent {
  final String mail;
  final String passwordOne;
  final String passwordTwo;
  RegisterNewAcountEvent({
    required this.mail,
    required this.passwordOne,
    required this.passwordTwo,
  });
  @override
  List<Object?> get props => [mail, passwordOne];
}

class VerificationMailEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class SendVerificationMailEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class SendPasswordResetEmailEvent extends AuthPersonEvent {
  final String email;
  SendPasswordResetEmailEvent({
    required this.email,
  });
  @override
  List<Object?> get props => [];
}

class StartAuthPageEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class StartRegisterPageEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class StartRecoveryPageEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class AuthCheckEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}

class LogOutEvent extends AuthPersonEvent {
  @override
  List<Object?> get props => [];
}
