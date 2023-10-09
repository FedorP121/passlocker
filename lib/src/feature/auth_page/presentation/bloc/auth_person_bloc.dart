import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:untitled9/core/use_case/use_case.dart';
import 'package:untitled9/src/feature/auth_page/domain/entities/registration_details.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/check_user_status.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/check_verificacion_main_firebase.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/log_out_firebase.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/login_firebase.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/registracion_firebase.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/send_password_reset_email.dart';
import 'package:untitled9/src/feature/auth_page/domain/use_case/send_verification_mail_firebase.dart';

part 'auth_person_event.dart';
part 'auth_person_state.dart';

@injectable
class AuthPersonBloc extends Bloc<AuthPersonEvent, AuthPersonState> {
  AuthPersonBloc(
    this.firebaseAcount,
    this.registracionNewFirebaseAcount,
    this.verificationMailFirebase,
    this.sendVerificationMailFirebase,
    this.sendPasswordResetEmail,
    this.checkUserStatus,
    this.logOutFirebaseAcount,
  ) : super(AuthWidgetState()) {
    on<CorrectCodeEvent>(_correctCodeEvent);
    on<LoginInAcountEvent>(_loginInAcountEvent);
    on<RegisterNewAcountEvent>(_registerNewAcountEvent);
    on<VerificationMailEvent>(_verificationMailEvent);
    on<SendVerificationMailEvent>(_sendVerificationMailEvent);
    on<SendPasswordResetEmailEvent>(_sendPasswordResetEmail);
    on<StartAuthPageEvent>(_startAuthPageEvent);
    on<StartRecoveryPageEvent>(_startRecoveryPageEvent);
    on<StartRegisterPageEvent>(_startRegisterPageEvent);
    on<AuthCheckEvent>(_authCheckEvent);
    on<LogOutEvent>(_logOutEvent);
  }

  final OnLoginFirebaseAcount firebaseAcount;
  final RegistracionNewFirebaseAcount registracionNewFirebaseAcount;
  final CheckVerificationMailFirebase verificationMailFirebase;
  final SendVerificationMailFirebase sendVerificationMailFirebase;
  final SendPasswordResetEmail sendPasswordResetEmail;
  final CheckUserStatus checkUserStatus;
  final LogOutFirebaseAcount logOutFirebaseAcount;

  void _correctCodeEvent(
    CorrectCodeEvent event,
    Emitter<AuthPersonState> emit,
  ) {
    emit(CorrectCodeState());
  }

  void _loginInAcountEvent(
    LoginInAcountEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    // убираем пробелы
    final mail = event.mail.trim();
    final password = event.password.trim();
    // убираем делаем проверки и отправляем в фб
    if (mail.isNotEmpty && password.isNotEmpty) {
      emit(LoadingState());
      final either = await firebaseAcount
          .call(RegistrationDetails(mail: mail, password: password));
      either.fold(
        (l) => emit(ErrorFirebaseState(error: l)),
        (r) => emit(LoginFirebaseState(inLogin: r)),
      );
    } else {
      emit(ErrorFirebaseState(error: 'Ведите логин и пароль'));
    }
  }

  void _registerNewAcountEvent(
    RegisterNewAcountEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    // убираем пробелы
    final mail = event.mail.trim();
    final passwordOne = event.passwordOne.trim();
    final passwordTwo = event.passwordTwo.trim();

    if (mail.isNotEmpty && passwordOne.isNotEmpty && passwordTwo.isNotEmpty) {
      if (passwordOne == passwordTwo) {
        emit(LoadingRegisterState());
        final either = await registracionNewFirebaseAcount
            .call(RegistrationDetails(mail: mail, password: passwordOne));
        either.fold(
          (l) => emit(ErrorRegisterState(error: l)),
          (r) {
            if (r == 'Успешная регистрация') {
              emit(RegisterFirebaseState(register: r));
            } else {
              emit(ErrorRegisterState(error: r));
            }
          },
        );
      } else {
        emit(ErrorRegisterState(error: 'Пароли не совпадают'));
      }
    } else {
      emit(ErrorRegisterState(error: 'Введите логин и пароль'));
    }
  }

  void _verificationMailEvent(
    VerificationMailEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    final verification = await verificationMailFirebase.call(NoParams());

    verification.fold(
      (l) => emit(ErrorRegisterState(error: l)),
      (r) {
        if (r == 'Почта подтверждена') {
          return emit(VericationMailFirebaseState(verification: r));
        } else {
          emit(SendVerificationMailState(message: r));
        }
      },
    );
  }

  void _sendVerificationMailEvent(
    SendVerificationMailEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    emit(LoadingSendVerificationMailState());
    await Future.delayed(const Duration(seconds: 60));
    final send = await sendVerificationMailFirebase.call(NoParams());

    send.fold(
      (l) => emit(ErrorSendVerificationMailState()),
      (r) {
        emit(SendVerificationMailState(message: ''));
      },
    );
  }

  void _sendPasswordResetEmail(
    SendPasswordResetEmailEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    if (event.email.isNotEmpty) {
      final message = await sendPasswordResetEmail.call(event.email);
      message.fold(
        (l) => emit(ErrorPaswordState(error: l)),
        (r) {
          if (r == 'Письмо успешно отправлено') {
            emit(SendPasswordResetEmailState(message: r));
          } else {
            emit(ErrorPaswordState(error: r));
          }
        },
      );
    } else {
      emit(ErrorPaswordState(error: 'Ведите почту'));
    }
  }

  void _startAuthPageEvent(
    StartAuthPageEvent event,
    Emitter<AuthPersonState> emit,
  ) {
    emit(StartAuthState());
  }

  void _startRecoveryPageEvent(
    StartRecoveryPageEvent event,
    Emitter<AuthPersonState> emit,
  ) {
    emit(StartRecoveryPasswordState());
  }

  void _startRegisterPageEvent(
    StartRegisterPageEvent event,
    Emitter<AuthPersonState> emit,
  ) {
    emit(StartRegisterState());
  }

  void _authCheckEvent(
    AuthCheckEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    final userStatusStream = checkUserStatus.call(NoParams());

    await for (var either in userStatusStream) {
      either.fold(
        (failure) => emit(ErrorAuthCheckState(error: failure.toString())),
        (user) {
          if (user.emailVerified == true) {
            emit(
              AuthCheckedState(
                auth: user.emailVerified,
                userID: user.uid,
              ),
            );
          } else {
            emit(ErrorAuthCheckState(error: 'Что то пошло не так'));
          }
        },
      );
    }
  }

  void _logOutEvent(
    LogOutEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    final answer = await logOutFirebaseAcount.call(NoParams());
    answer.fold(
      (failure) => null,
      (answer) => emit(
        AuthCheckedState(
          userID: '',
          auth: false,
        ),
      ),
    );
  }
}
