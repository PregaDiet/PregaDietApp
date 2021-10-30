import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prega_diet/common/model/failure.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/common/model/user_details.dart';
import 'package:prega_diet/login/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginState.initial());

  LoginRepository repository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(loadStatus: LoadStatus.initial));
    try {
      final userDetails =
          await repository.signIn(email: email, password: password);

      emit(state.copyWith(
        loadStatus: LoadStatus.loaded,
        userDetails: userDetails,
      ));
    } catch (e, s) {
      emit(
          state.copyWith(loadStatus: LoadStatus.error, failure: Failure(e, s)));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final userDetails = await repository.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      emit(state.copyWith(
        loadStatus: LoadStatus.loaded,
        userDetails: userDetails,
      ));
    } catch (e, s) {
      emit(
          state.copyWith(loadStatus: LoadStatus.error, failure: Failure(e, s)));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      await repository.signOut();
      emit(state.copyWith(
          loadStatus: LoadStatus.initial, userDetails: UserDetails.initial()));
    } catch (e, s) {
      emit(
          state.copyWith(loadStatus: LoadStatus.error, failure: Failure(e, s)));
    }
  }
}
