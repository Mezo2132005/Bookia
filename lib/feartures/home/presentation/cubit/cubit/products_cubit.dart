import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  
  void getProducts() async {
    emit(ProductsLoading());
    final result = await HomeRepo.homeRepo.productsGet();
    switch (result) {
      case ApiSuccess(:final data):
        emit(ProductsSuccess(data));
      case ApiError(:final message):
        emit(ProductsFailed(message));
    }
  }
}
