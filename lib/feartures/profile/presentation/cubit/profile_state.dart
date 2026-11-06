part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileResponseModel response;
  ProfileSuccess(this.response);
}
final class ProfileFailed extends ProfileState {}


final class LogOutLoading extends ProfileState {}
final class LogOutSuccess extends ProfileState {
  final bool? response;
  LogOutSuccess(this.response);
}
final class LogOutFailed extends ProfileState {}
