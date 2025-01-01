part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeNavigationToProductsScreen extends HomeEvent{}
class HomeNavigationToFormScreen extends HomeEvent{}