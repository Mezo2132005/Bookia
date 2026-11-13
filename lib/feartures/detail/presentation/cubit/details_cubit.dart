import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';
import 'package:bookia_application/feartures/detail/data/repo/add_wish_repo.dart';
import 'package:bookia_application/feartures/detail/data/repo/details_repo.dart';
import 'package:bookia_application/feartures/detail/data/repo/remove_wish_repo.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  void getProductDetails(int id) async {
    emit(DetailsLoading());
    final result = await DetailsRepo.detailsRepo.productGet(id);
    switch (result) {
      case ApiSuccess(:final data):
        emit(DetailsSuccess(data));
      case ApiError(:final message):
        emit(DetailsFailed(message));
    }
  }

  void wishListAdd(int? id) async {
    emit(WishAddLoading());
    final result = await AddWishRepo.addWishRepo.wishListAdd(id);
    switch (result) {
      case ApiSuccess():
        emit(WishAddSuccess());
      case ApiError(:final message):
        emit(WishAddFailed(message));
    }
  }

  void wishListRemove(int? id) async {
    emit(WishRemoveLoading());
    final result = await RemoveWishRepo.removeWishRepo.wishListRemove(id);
    switch (result) {
      case ApiSuccess():
        emit(WishRemoveSuccess());
      case ApiError(:final message):
        emit(WishRemoveFailed(message));
    }
  }
}
