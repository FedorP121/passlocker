import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_person_event.dart';
part 'auth_person_state.dart';

class AuthPersonBloc extends Bloc<AuthPersonEvent, AuthPersonState> {
  AuthPersonBloc() : super(AuthPersonInitial()) {
    on<AuthPersonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
