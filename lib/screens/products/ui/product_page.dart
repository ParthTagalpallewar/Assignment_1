import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/screens/product_details/ui/product_details_page.dart';
import 'package:untitled/screens/products/bloc/product_bloc.dart';
import 'package:untitled/screens/products/ui/product_tile.dart';
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _HomeState();
}

class _HomeState extends State<ProductsScreen> {
  @override
  void initState() {
    homeBloc.add(ProductInitialEvent());
    super.initState();
  }

  final ProductBloc homeBloc = ProductBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is ProductActionState,
      buildWhen: (previous, current) => current is! ProductActionState,
      listener: (context, state) {
        if (state is ProductNavigateToProductDetailsPageActionState) {
          Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: state.product)
              )
            );
        } 
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProductLoadingState:
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case ProductLoadedSuccessState:
            final successState = state as ProductLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Shopping App'),
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        productBloc: homeBloc,
                        product: successState.products[index]);
                  }),
            );

          case ProductErrorState:
            return const Scaffold(body: Center(child: Text('Error')));
          default:
            return const SizedBox();
        }
      },
    );
  }
}