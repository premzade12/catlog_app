import 'package:catlog_app/models/catalog.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CartModel extends ChangeNotifier {
  // Singleton pattern
  static final CartModel cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  late CatalogModel _catalog;
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getById(id)).whereType<Item>().toList();

  // Total price of cart items
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // ✅ Total price formatted without decimals
  String get formattedTotalPrice => NumberFormat.currency(
        locale: 'en_IN',
        symbol: '₹',
        decimalDigits: 0, // remove decimals
      ).format(totalPrice);

  // ✅ Total items count
  int get totalItems => _itemIds.length;

  void add(Item item) {
    if (!_itemIds.contains(item.id)) {
      _itemIds.add(item.id);
      notifyListeners();
    }
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }

  void clear() {
    _itemIds.clear();
    notifyListeners();
  }
}
