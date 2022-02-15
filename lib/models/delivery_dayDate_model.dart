import 'package:equatable/equatable.dart';

class DeliveryTime extends Equatable {
  final int id;
  final String value;
  final DateTime time;

  DeliveryTime({
    required this.id,
    required this.value,
    required this.time,
  });

  @override
  List<Object?> get props => [id, value, time];

  static List<DeliveryTime> deliveryTimes = [
    DeliveryTime(
      id: 1,
      value: "10:00am",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        10,
        0,
      ),
    ),
    DeliveryTime(
      id: 2,
      value: "12.00pm",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        12,
        0,
      ),
    ),
    DeliveryTime(
      id: 3,
      value: "3:00pm",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        15,
        0,
      ),
    ),
    DeliveryTime(
      id: 4,
      value: "5:30pm",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        17,
        30,
      ),
    ),
    DeliveryTime(
      id: 5,
      value: "7:00pm",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        19,
        0,
      ),
    ),
    DeliveryTime(
      id: 6,
      value: "9:00pm",
      time: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        21,
        00,
      ),
    ),
  ];
}

class DeliveryDay extends Equatable {
  final String day;
  final int id;

  DeliveryDay({required this.day, required this.id});

  @override
  List<Object?> get props => [day, id];

  static List<DeliveryDay> deliveryDay = [
    DeliveryDay(day: "Today", id: 1),
    DeliveryDay(day: "Tommorow", id: 2),
  ];
}
