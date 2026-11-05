part of 'wish_list_cubit.dart';

@immutable
sealed class WishListState {}

final class WishListInitial extends WishListState {}
final class WishListLoading extends WishListState {}
final class WishListSuccess extends WishListState {
  final WishListResponseModel? response;
  WishListSuccess(this.response);
}
final class WishListFailed extends WishListState {}
