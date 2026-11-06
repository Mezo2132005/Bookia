import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:bookia_application/feartures/profile/data/models/profile_response_model.dart';
import 'package:bookia_application/feartures/profile/data/repo/log_out_repo.dart';
import 'package:bookia_application/feartures/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void showProfile()async{
    emit(ProfileLoading());
    final ProfileResponseModel? response = await ProfileRepo.profileRepo.showProfile();
    if (response == null){
      emit(ProfileFailed());
    }else{
      emit(ProfileSuccess(response));
    }
  }

  void logOut()async{
    emit(LogOutLoading());
    final bool? response = await LogOutRepo.logOutRepo.logOut();
    if (response == null){
      emit(LogOutFailed());
    }else{
      emit(LogOutSuccess(response));
    }
  }

}
