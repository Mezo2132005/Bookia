import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/auth/data/repo/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());


  Future<void> login(String email,String password)async{
    emit(LoginLoading());
    final bool? response = await AuthRepo.authRepo.login(email,password);
    if (response == true){
      emit(LoginSuccess());
    }else{
      emit(LoginError());
    }
  }

}
