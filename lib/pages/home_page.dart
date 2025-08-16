import 'package:catlog_app/models/cart.dart';
import 'package:catlog_app/utils/routes.dart';
import 'package:catlog_app/utils/widgets/home_widgets/add_to_cart.dart';
import 'package:catlog_app/utils/widgets/home_widgets/catalog_header.dart';
import 'package:catlog_app/utils/widgets/home_widgets/catalog_image.dart';
import 'package:catlog_app/utils/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catlog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = CartModel(); // singleton

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: AnimatedBuilder(
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
      ),
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                const Center(child: CircularProgressIndicator()).expand()
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.secondaryHeaderColor)
                    .bold
                    .make(),
                catalog.desc.text
                    .textStyle(context.captionStyle!)
                    .color(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[500]!
                          : Colors.grey[700]!,
                    )
                    .make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    catalog.formattedPrice.text.bold.xl.color(
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ).make(),
                    AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
