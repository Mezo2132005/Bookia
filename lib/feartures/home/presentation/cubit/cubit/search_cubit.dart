import 'package:bloc/bloc.dart';
import 'package:bookia_application/core/networking/api_result.dart';
import 'package:bookia_application/feartures/home/data/models/products_model.dart';
import 'package:bookia_application/feartures/home/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void getProducts(String search) async {
    emit(SearchLoading());
    final result = await SearchRepo.searchRepo.searchProducts(search);
    switch (result) {
      case ApiSuccess(:final data):
        emit(SearchSuccess(data));
      case ApiError(:final message):
        emit(SearchFailed(message));
    }
  }
}
