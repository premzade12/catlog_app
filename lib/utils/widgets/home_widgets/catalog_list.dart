import 'package:catlog_app/models/catalog.dart';
import 'package:catlog_app/pages/home_detail_page.dart';
import 'package:catlog_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          child: Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogItem(catalog: catalog),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailsPage(catalog: catalog),
            ),
          ),
        );
      },
    );
  }
}
