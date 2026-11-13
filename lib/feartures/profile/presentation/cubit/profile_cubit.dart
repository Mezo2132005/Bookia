import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/profile/data/models/profile_response_model.dart';
import 'package:bookia_application/feartures/profile/data/repo/log_out_repo.dart';
import 'package:bookia_application/feartures/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void showProfile() async {
    emit(ProfileLoading());
    final result = await ProfileRepo.profileRepo.showProfile();
    switch (result) {
      case ApiSuccess(:final data):
        emit(ProfileSuccess(data));
      case ApiError(:final message):
        emit(ProfileFailed(message));
    }
  }

  void logOut() async {
    emit(LogOutLoading());
    final result = await LogOutRepo.logOutRepo.logOut();
    switch (result) {
      case ApiSuccess(:final data):
        emit(LogOutSuccess(data));
      case ApiError(:final message):
        emit(LogOutFailed(message));
    }
  }
}
