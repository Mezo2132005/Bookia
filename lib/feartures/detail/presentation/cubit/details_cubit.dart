import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/detail/data/models/details_model.dart';
import 'package:bookia_application/feartures/detail/data/repo/details_repo.dart';
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
}
