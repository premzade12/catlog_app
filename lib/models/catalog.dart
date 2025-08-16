// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:intl/intl.dart'; // For number formatting

class CatalogModel {
  static final catModel = CatalogModel._internal();

  CatalogModel._internal();

  factory CatalogModel() => catModel;

  static List<Item> items = [];

  Item? getById(int id) {
    try {
      return items.firstWhere((element) => element.id == id);
    } catch (_) {
      return null;
    }
  }

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String detail; // 👈 New field for long description
  final int price; // store as int
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.detail, // 👈 required in constructor
    required this.price,
    required this.color,
    required this.image,
  });

  // Formatted price
  String get formattedPrice {
    final formatter = NumberFormat('#,###');
    return '₹ ${formatter.format(price)}';
  }

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    String? detail,
    int? price,
    String? color,
    String? image,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      detail: detail ?? this.detail, // 👈 include detail
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'detail': detail, // 👈 include detail
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    int priceInt;

    // Handle both int and string prices
    if (map['price'] is int) {
      priceInt = map['price'] as int;
    } else {
      String priceStr = map['price'] as String;
      priceInt = int.parse(priceStr.replaceAll(RegExp(r'[₹,]'), ''));
    }

    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      desc: map['desc'] as String,
      detail: map['detail'] as String? ??
          "", // 👈 fallback to empty string if missing
      price: priceInt,
      color: map['color'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, detail: $detail, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.detail == detail &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        detail.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
