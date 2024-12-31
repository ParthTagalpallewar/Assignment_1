part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedSuccessState extends ProductState {
  final List<Product> products;
  ProductLoadedSuccessState({
    required this.products,
  });
}

class ProductErrorState extends ProductState {}

class ProductNavigateToProductDetailsPageActionState extends ProductActionState {
  final Product product;
  ProductNavigateToProductDetailsPageActionState(this.product);
}


