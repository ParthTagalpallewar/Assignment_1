part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeNavigationToProductScreenState extends HomeState{}
class HomeNavigationToFormScreenState extends HomeState{}
