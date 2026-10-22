import 'package:bloc/bloc.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  
  void getProducts()async{
    emit(ProductsLoading());
    final ProductsModel? response = await HomeRepo.homeRepo.productsGet();
    if (response == null){
      emit(ProductsFailed());
    }else{
      emit(ProductsSuccess(response));
    }
  }
}
