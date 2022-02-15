import 'package:equatable/equatable.dart';
import 'package:food_delivery_application/models/delivery_dayDate_model.dart';
import 'package:food_delivery_application/models/menu_item_model.dart';
import 'package:food_delivery_application/models/voucher_model.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

  Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
    this.voucher,
    this.deliveryTime,
  });

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        items,
        cutlery,
        voucher,
        deliveryTime,
      ];

  Map itemQuantity(items) {
    var quantity = Map();

    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    if (voucher == null && cutlery == false) {
      return subtotal + 5;
    } else if (voucher == null && cutlery == true) {
      return subtotal + 5 + 3.5;
    } else if (voucher != null && cutlery == false) {
      return subtotal + 5 - voucher!.value;
    } else {
      return subtotal + 5 + 3.5 - voucher!.value;
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString => total(subtotal).toStringAsFixed(2);
}
