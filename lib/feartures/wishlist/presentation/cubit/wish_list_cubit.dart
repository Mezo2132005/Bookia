import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/wishlist/data/models/wish_list_response_model.dart';
import 'package:bookia_application/feartures/wishlist/data/repo/wish_list_repo.dart';
import 'package:meta/meta.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());

  void getProducts()async{
    emit(WishListLoading());
    final WishListResponseModel? response = await WishListRepo.homeRepo.wishListGet();
    if (response == null){
      emit(WishListFailed());
    }else{
      emit(WishListSuccess(response));
    }
  }

}
