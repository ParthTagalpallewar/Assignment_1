import 'package:flutter/material.dart';
import 'package:untitled/models/product_model.dart';
import 'package:untitled/screens/products/bloc/product_bloc.dart';

class ProductTileWidget extends StatelessWidget {
  final Product product;
  final ProductBloc productBloc;
  const ProductTileWidget(
      {super.key, required this.product, required this.productBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        productBloc.add(ProductDetailsClickedEvent(clickedProduct: product));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.getImage()))),
            ),
            const SizedBox(height: 20),
            Text(product.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${product.price}",
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
