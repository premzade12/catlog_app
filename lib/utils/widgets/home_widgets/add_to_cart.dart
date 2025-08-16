import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;

  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final cartModel = CartModel(); // singleton

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: cartModel, // rebuild when cart changes
      builder: (context, _) {
        bool isInCart = cartModel.items.contains(widget.catalog);

        return ElevatedButton(
          onPressed: () {
            final catalogModel = CatalogModel();
            cartModel.catalog = catalogModel;

            if (isInCart) {
              cartModel.remove(widget.catalog);
            } else {
              cartModel.add(widget.catalog);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.primaryColor),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          child: isInCart
              ? const Icon(Icons.done)
              : const Icon(Icons.add, color: Colors.white),
        );
      },
    );
  }
}
