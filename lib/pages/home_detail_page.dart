import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/utils/routes.dart';
import 'package:catlog_app/utils/widgets/home_widgets/add_to_cart.dart';
import 'package:catlog_app/utils/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    final cartModel = CartModel(); // singleton (same as HomePage)

    return Scaffold(
      backgroundColor: context.canvasColor,

      // ✅ Floating cart button added here
      floatingActionButton: AnimatedBuilder(
        animation: cartModel,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MyRoutes.cartRoute),
                backgroundColor: context.theme.colorScheme.primary,
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                child: const Icon(CupertinoIcons.cart),
              ),
              if (cartModel.items.isNotEmpty)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      cartModel.items.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),

      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            catalog.formattedPrice.text.bold.xl4.color(
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ).make(),
            AddToCart(catalog: catalog).wh(130, 50),
          ],
        ).p32(),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.canvasColor,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.darkBluishColor)
                          .bold
                          .make()
                          .centered(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make()
                          .centered(),
                      10.heightBox,
                      (catalog.detail.isNotEmpty
                              ? catalog.detail
                              : "No extra details available")
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
