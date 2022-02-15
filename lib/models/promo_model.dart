import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];

  static List<Promo> promos = [
    Promo(
      id: 1,
      title: "FREE Delivery on Your FIrst 3 Orders",
      description:
          "Place an order of \$10 or more and the delivery fee is on us.",
      imageUrl: "assets/image/promobox_one.jpg",
    ),
    Promo(
      id: 2,
      title: "20% Off on Selected Restaurants",
      description: "Get a discount at 200+ restaurants.",
      imageUrl: "assets/image/promobox_two.jpg",
    ),
    Promo(
      id: 3,
      title: "Holiday Sushi",
      description: "Holiday special offer for limited time only.",
      imageUrl: "assets/image/promobox_three.jpg",
    )
  ];
}
