part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}
final class DetailsLoading extends DetailsState {}
final class DetailsSuccess extends DetailsState {
  final DetailsModel response;
  DetailsSuccess(this.response);
}
final class DetailsFailed extends DetailsState {}

final class WishAddLoading extends DetailsState {}
final class WishAddFailed extends DetailsState {}
final class WishAddSuccess extends DetailsState {}

final class WishRemoveLoading extends DetailsState {}
final class WishRemoveFailed extends DetailsState {}
final class WishRemoveSuccess extends DetailsState {}