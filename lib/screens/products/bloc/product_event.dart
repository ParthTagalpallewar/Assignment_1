part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductInitialEvent extends ProductEvent {}


class ProductDetailsClickedEvent extends ProductEvent {
  final Product clickedProduct;
  ProductDetailsClickedEvent({
    required this.clickedProduct,
  });
}