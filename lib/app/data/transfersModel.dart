import 'package:baraka_trans/app/data/tranportaionModel.dart';

class TranfersModel {
  final int id;
  final int userId;
  final int busId;
  final int routeId;
  final String tripNumber;
  final int numberOfBags;
  final int numberOfRiders;
  final String travelAirlines;
  final DateTime time;
  final DateTime date;
  final String origin;
  final String destination;
  final String? reservationStatus;
  final String? paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final transRoutes? route;
  final Transportation? transportation; // Updated to include Bus details

  TranfersModel(
      {required this.id,
      required this.userId,
      required this.busId,
      required this.routeId,
      required this.tripNumber,
      required this.numberOfBags,
      required this.numberOfRiders,
      required this.travelAirlines,
      required this.time,
      required this.date,
      required this.origin,
      required this.destination,
      required this.createdAt,
      required this.updatedAt,
      this.route,
      this.paymentStatus,
      this.reservationStatus,
      this.transportation});

  factory TranfersModel.fromJson(Map<String, dynamic> json) {
    return TranfersModel(
      id: json['id'],
      userId: json['user_id'],
      busId: json['bus_id'],
      routeId: json['route_id'],
      tripNumber: json['trip_number'],
      numberOfBags: json['number_of_bags'],
      numberOfRiders: json['number_of_riders'],
      travelAirlines: json['travel_airlines'],
      time: DateTime.parse(json['time']),
      date: DateTime.parse(json['date']),
      origin: json['origin'],
      destination: json['destination'],
      reservationStatus: json['reservation_status'],
      paymentStatus: json['payment_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      transportation:
          json['bus'] != null ? Transportation.fromJson(json['bus']) : null,
      route: json['route'] != null ? transRoutes.fromJson(json['route']) : null,
    );
  }
}

class Transportation {
  final int id;
  final String type;
  final String description;
  final String
      companyName; // Corrected typo from "compnay_name" to "companyName"
  final List<String> images;
  final int categoryId;
  final int capacity;
  final int luggageCapacity;
  final int maxSpeed;
  final bool isAvailable;
  final List<String> features;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transportation({
    required this.id,
    required this.type,
    required this.description,
    required this.companyName,
    required this.images,
    required this.categoryId,
    required this.capacity,
    required this.luggageCapacity,
    required this.maxSpeed,
    required this.isAvailable,
    required this.features,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transportation.fromJson(Map<String, dynamic> json) {
    return Transportation(
      id: json['id'],
      type: json['type'],
      description: json['description'],
      companyName: json['compnay_name'], // Use the same key from JSON
      images: List<String>.from(json['images']),
      categoryId: json['category_id'],
      capacity: json['capacity'],
      luggageCapacity: json['luggage_capacity'],
      maxSpeed: json['max_speed'],
      isAvailable: json['is_available'],
      features: List<String>.from(json['features']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
