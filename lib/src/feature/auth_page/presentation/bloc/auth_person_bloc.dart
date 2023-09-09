// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_person_event.dart';
part 'auth_person_state.dart';

class AuthPersonBloc extends Bloc<AuthPersonEvent, AuthPersonState> {
  AuthPersonBloc() : super(AuthPersonInitial()) {
    on<AuthPersonEvent>((event, emit) {});
  }
}
