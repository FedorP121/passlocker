import 'package:equatable/equatable.dart';

class RegistrationDetails extends Equatable {
  final String password;
  final String mail;
  const RegistrationDetails({
    required this.password,
    required this.mail,
  });

  @override
  List<Object> get props => [password, mail];
}
