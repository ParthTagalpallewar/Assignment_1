import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/models/network_response.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/models/response_type.dart';
import 'package:untitled/repository/api_provider.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductInitialEvent>(productInitialEvent);
    on<ProductDetailsClickedEvent>(productDetailsClickedEvent);
  }

  FutureOr<void> productInitialEvent(
      ProductInitialEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());
    NetworkResponse networkResponse = await ApiProvider.getProducts();

    if (networkResponse.responseType == ResponseType.SUCCESS) {
      emit(ProductLoadedSuccessState(products: networkResponse.result));
    } else {
      emit(ProductErrorState());
    }
  }

  FutureOr<void> productDetailsClickedEvent(
      ProductDetailsClickedEvent event, Emitter<ProductState> emit) {
    emit(ProductNavigateToProductDetailsPageActionState(event.clickedProduct));
  }
}
