// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/feature/auth_page/data/data_source/auth_firebase_service.dart'
    as _i3;
import '../../src/feature/auth_page/data/repositiry/firebase_repository_impl.dart'
    as _i6;
import '../../src/feature/auth_page/domain/repository/firebase_repository.dart'
    as _i5;
import '../../src/feature/auth_page/domain/use_case/check_user_status.dart'
    as _i16;
import '../../src/feature/auth_page/domain/use_case/check_verificacion_main_firebase.dart'
    as _i17;
import '../../src/feature/auth_page/domain/use_case/log_out_firebase.dart'
    as _i7;
import '../../src/feature/auth_page/domain/use_case/login_firebase.dart' as _i8;
import '../../src/feature/auth_page/domain/use_case/registracion_firebase.dart'
    as _i11;
import '../../src/feature/auth_page/domain/use_case/send_password_reset_email.dart'
    as _i12;
import '../../src/feature/auth_page/domain/use_case/send_verification_mail_firebase.dart'
    as _i13;
import '../../src/feature/auth_page/presentation/bloc/auth_person_bloc.dart'
    as _i20;
import '../../src/feature/category_page/data/data_source/realtime_database_service.dart'
    as _i4;
import '../../src/feature/category_page/data/repositiry/impl_realtime_database_repository.dart'
    as _i10;
import '../../src/feature/category_page/domain/repository/realtime_database_repository.dart'
    as _i9;
import '../../src/feature/category_page/domain/use_case/listen_data_firebase.dart'
    as _i18;
import '../../src/feature/category_page/domain/use_case/write_new_category.dart'
    as _i14;
import '../../src/feature/category_page/domain/use_case/write_new_password_firebase.dart'
    as _i15;
import '../../src/feature/category_page/prsentation/bloc/category_pass_bloc.dart'
    as _i19;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.FirebaseService>(() => _i3.FirebaseService());
    gh.factory<_i4.RealtimeDatabaseServ>(() => _i4.RealtimeDatabaseServ());
    gh.factory<_i5.FirebaseRepository>(() =>
        _i6.FirebaseRepositoryImpl(firebaseService: gh<_i3.FirebaseService>()));
    gh.factory<_i7.LogOutFirebaseAcount>(() => _i7.LogOutFirebaseAcount(
        firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i8.OnLoginFirebaseAcount>(() => _i8.OnLoginFirebaseAcount(
        firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i9.RealtimeDatabaseRepository>(() =>
        _i10.RealtimeDatabaseRepositoryImpl(
            realtimeDatabaseServ: gh<_i4.RealtimeDatabaseServ>()));
    gh.factory<_i11.RegistracionNewFirebaseAcount>(() =>
        _i11.RegistracionNewFirebaseAcount(
            firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i12.SendPasswordResetEmail>(() => _i12.SendPasswordResetEmail(
        firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i13.SendVerificationMailFirebase>(() =>
        _i13.SendVerificationMailFirebase(
            firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i14.WriteNewCategoryFirebase>(() =>
        _i14.WriteNewCategoryFirebase(
            realtimeDatabaseRepository: gh<_i9.RealtimeDatabaseRepository>()));
    gh.factory<_i15.WriteNewPasswordFirebase>(() =>
        _i15.WriteNewPasswordFirebase(
            realtimeDatabaseRepository: gh<_i9.RealtimeDatabaseRepository>()));
    gh.factory<_i16.CheckUserStatus>(
        () => _i16.CheckUserStatus(gh<_i5.FirebaseRepository>()));
    gh.factory<_i17.CheckVerificationMailFirebase>(() =>
        _i17.CheckVerificationMailFirebase(
            firebaseRepository: gh<_i5.FirebaseRepository>()));
    gh.factory<_i18.ListenDataFirebase>(() => _i18.ListenDataFirebase(
        realtimeDatabaseRepository: gh<_i9.RealtimeDatabaseRepository>()));
    gh.factory<_i19.PassLockerBloc>(() => _i19.PassLockerBloc(
          gh<_i15.WriteNewPasswordFirebase>(),
          gh<_i18.ListenDataFirebase>(),
          gh<_i14.WriteNewCategoryFirebase>(),
        ));
    gh.factory<_i20.AuthPersonBloc>(() => _i20.AuthPersonBloc(
          gh<_i8.OnLoginFirebaseAcount>(),
          gh<_i11.RegistracionNewFirebaseAcount>(),
          gh<_i17.CheckVerificationMailFirebase>(),
          gh<_i13.SendVerificationMailFirebase>(),
          gh<_i12.SendPasswordResetEmail>(),
          gh<_i16.CheckUserStatus>(),
          gh<_i7.LogOutFirebaseAcount>(),
        ));
    return this;
  }
}
