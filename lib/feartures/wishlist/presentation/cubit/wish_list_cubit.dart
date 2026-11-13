import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/wishlist/data/models/wish_list_response_model.dart';
import 'package:bookia_application/feartures/wishlist/data/repo/wish_list_repo.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  void getProducts() async {
    emit(WishListLoading());
    final result = await WishListRepo.homeRepo.wishListGet();
    switch (result) {
      case ApiSuccess(:final data):
        emit(WishListSuccess(data));
      case ApiError(:final message):
        emit(WishListFailed(message));
    }
  }
}
