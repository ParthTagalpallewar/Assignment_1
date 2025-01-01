import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeNavigationToProductsScreen>(homeNavigationToProductScreen);
    on<HomeNavigationToFormScreen>(homeNavigationToFormScreen);
  }

  FutureOr<void> homeNavigationToProductScreen(
      HomeNavigationToProductsScreen event, Emitter<HomeState> emit) {
    print("home bloc");
    emit(HomeNavigationToProductScreenState());
  }

  FutureOr<void> homeNavigationToFormScreen(
      HomeNavigationToFormScreen event, Emitter<HomeState> emit) {
    emit(HomeNavigationToFormScreenState());
  }


}
