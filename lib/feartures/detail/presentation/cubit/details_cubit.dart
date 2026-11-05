import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';
import 'package:bookia_application/feartures/detail/data/repo/add_wish_repo.dart';
import 'package:bookia_application/feartures/detail/data/repo/details_repo.dart';
import 'package:bookia_application/feartures/detail/data/repo/remove_wish_repo.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  void getProductDetails(int id)async{
    emit(DetailsLoading());
    final DetailsModel? response = await DetailsRepo.detailsRepo.productGet(id);
    if (response == null){
      emit(DetailsFailed());
    }else{
      emit(DetailsSuccess(response));
    }
  }

  void wishListAdd(int? id)async{
    emit(WishAddLoading());
    final bool? response = await AddWishRepo.addWishRepo.wishListAdd(id);
    if (response == null){
      emit(WishAddFailed());
    }else{
      emit(WishAddSuccess());
    }
  }

  void wishListRemove(int? id)async{
    emit(WishRemoveLoading());
    final bool? response = await RemoveWishRepo.removeWishRepo.wishListRemove(id);
    if (response == null){
      emit(WishRemoveFailed());
    }else{
      emit(WishRemoveSuccess());
    }
  }
}
