import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/auth/data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await AuthRepo.authRepo.login(email, password);

    switch (result) {
      case ApiSuccess():
        emit(LoginSuccess());
      case ApiError(:final message):
        emit(LoginError(message));
    }
  }
}