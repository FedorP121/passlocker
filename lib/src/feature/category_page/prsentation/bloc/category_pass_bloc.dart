// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/category_model.dart';

import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/domain/use_case/listen_data_firebase.dart';
import 'package:untitled9/src/feature/category_page/domain/use_case/write_new_category.dart';
import 'package:untitled9/src/feature/category_page/domain/use_case/write_new_password_firebase.dart';

part 'category_pass_event.dart';
part 'category_pass_state.dart';

@injectable
class PassLockerBloc extends Bloc<CategoryPassEvent, CategoryPassState> {
  final WriteNewPasswordFirebase writeDataFirebase;
  final ListenDataFirebase listenDataFirebase;
  final WriteNewCategoryFirebase writeNewCategoryFirebase;
  PassLockerBloc(
    this.writeDataFirebase,
    this.listenDataFirebase,
    this.writeNewCategoryFirebase,
  ) : super(CategoryPassInitial()) {
    on<WriteNewPasswordEvent>(_writeNewPasswordEvent);
    on<ListenDataFirebaseEvent>(_listenDataFirebaseEvent);
    on<WriteNewCategoryEvent>(_writeNewCategoryEvent);
  }

  void _writeNewCategoryEvent(
    WriteNewCategoryEvent event,
    Emitter<CategoryPassState> emit,
  ) async {
    final either = await writeNewCategoryFirebase.call(event.categoryModel);
    either.fold(
      (l) => null,
      (r) => DataLoadedSuccessfullyState(),
    );
  }

  void _writeNewPasswordEvent(
    WriteNewPasswordEvent event,
    Emitter<CategoryPassState> emit,
  ) async {
    final either = await writeDataFirebase.call(event.passwordModel);
    either.fold(
      (l) => null,
      (r) => DataLoadedSuccessfullyState(),
    );
  }

  void _listenDataFirebaseEvent(
    ListenDataFirebaseEvent event,
    Emitter<CategoryPassState> emit,
  ) async {
    emit(LoadingState());

    final userData = listenDataFirebase.call(event.userID);
    await for (var either in userData) {
      either.fold(
        (error) => emit(ErrorState(error: error)),
        (user) => emit(ListenDataFirebaseState(passwordModel: user)),
      );
    }
  }
}

/*
 void _authCheckEvent(
    AuthCheckEvent event,
    Emitter<AuthPersonState> emit,
  ) async {
    emit(LoadingState());
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
  */
