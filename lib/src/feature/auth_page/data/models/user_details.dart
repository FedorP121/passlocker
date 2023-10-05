// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String uid;
  final String? email;
  final bool emailVerified;

  const UserDetails({
    required this.uid,
    this.email,
    required this.emailVerified,
  });

  @override
  List<Object> get props => [uid, emailVerified];

  factory UserDetails.fromFirebaseUser(
    String uid,
    String? email,
    bool emailVerified,
  ) {
    return UserDetails(
      uid: uid,
      email: email,
      emailVerified: emailVerified,
    );
  }
}
