class reservationModel {
  int? id;
  int? userId;
  int? busId;
  int? busRouteId;
  int? numPilgrims;
  int? numBuses;
  String? umrahCompany;
  String? meccaHotelName;
  String? medinaHotelName;
  String? reservationStatus;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  List<Payments>? payments;
  List<ArrivalDepartures>? arrivalDepartures;
  List<Visits>? visits;
  List<InternalMovements>? internalMovements;
  Bus? bus;
  BusRoute? busRoute;
  List<BookingContact>? bookingContact;

  reservationModel(
      {this.id,
      this.userId,
      this.busId,
      this.busRouteId,
      this.numPilgrims,
      this.numBuses,
      this.umrahCompany,
      this.meccaHotelName,
      this.medinaHotelName,
      this.reservationStatus,
      this.createdAt,
      this.updatedAt,
      this.payments,
      this.arrivalDepartures,
      this.visits,
      this.internalMovements,
      this.bus,
      this.busRoute,
      this.bookingContact,
      this.paymentStatus});

  reservationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    busId = json['bus_id'];
    busRouteId = json['bus_route_id'];
    numPilgrims = json['num_pilgrims'];
    numBuses = json['num_buses'];
    umrahCompany = json['umrah_company'];
    meccaHotelName = json['mecca_hotel_name'];
    medinaHotelName = json['medina_hotel_name'];
    reservationStatus = json['reservation_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
    if (json['arrival_departures'] != null) {
      arrivalDepartures = <ArrivalDepartures>[];
      json['arrival_departures'].forEach((v) {
        arrivalDepartures!.add(ArrivalDepartures.fromJson(v));
      });
    }
    if (json['visits'] != null) {
      visits = <Visits>[];
      json['visits'].forEach((v) {
        visits!.add(Visits.fromJson(v));
      });
    }
    if (json['internal_movements'] != null) {
      internalMovements = <InternalMovements>[];
      json['internal_movements'].forEach((v) {
        internalMovements!.add(InternalMovements.fromJson(v));
      });
    }
    bus = json['bus'] != null ? Bus.fromJson(json['bus']) : null;
    busRoute =
        json['bus_route'] != null ? BusRoute.fromJson(json['bus_route']) : null;
    if (json['booking_contact'] != null) {
      bookingContact = <BookingContact>[];
      json['booking_contact'].forEach((v) {
        bookingContact!.add(BookingContact.fromJson(v));
      });
    }
  }
}

class Payments {
  int? id;
  int? reservationId;
  int? userId;
  String? amount;
  String? paymentStatus;
  String? remainingAmount;
  String? paymentType;
  String? createdAt;
  String? updatedAt;

  Payments(
      {this.id,
      this.reservationId,
      this.userId,
      this.amount,
      this.paymentStatus,
      this.remainingAmount,
      this.paymentType,
      this.createdAt,
      this.updatedAt});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservation_id'];
    userId = json['user_id'];
    amount = json['amount'];
    paymentStatus = json['payment_status'];
    remainingAmount = json['remaining_amount'];
    paymentType = json['payment_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class ArrivalDepartures {
  int? id;
  int? reservationId;
  String? date;
  String? time;
  String? flightNumber;
  String? airline;
  String? type;
  String? createdAt;
  String? updatedAt;

  ArrivalDepartures(
      {this.id,
      this.reservationId,
      this.date,
      this.time,
      this.flightNumber,
      this.airline,
      this.type,
      this.createdAt,
      this.updatedAt});

  ArrivalDepartures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservation_id'];
    date = json['date'];
    time = json['time'];
    flightNumber = json['flight_number'];
    airline = json['airline'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Visits {
  int? id;
  int? reservationId;
  String? visitDate;
  String? fromPlace;
  String? toPlace;
  String? movementTime;
  String? busArrivalTime;
  String? createdAt;
  String? updatedAt;

  Visits(
      {this.id,
      this.reservationId,
      this.visitDate,
      this.fromPlace,
      this.toPlace,
      this.movementTime,
      this.busArrivalTime,
      this.createdAt,
      this.updatedAt});

  Visits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservation_id'];
    visitDate = json['visit_date'];
    fromPlace = json['from_place'];
    toPlace = json['to_place'];
    movementTime = json['movement_time'];
    busArrivalTime = json['bus_arrival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class InternalMovements {
  int? id;
  int? reservationId;
  String? movementDate;
  String? fromPlace;
  String? toPlace;
  String? movementTime;
  String? busArrivalTime;
  String? createdAt;
  String? updatedAt;

  InternalMovements(
      {this.id,
      this.reservationId,
      this.movementDate,
      this.fromPlace,
      this.toPlace,
      this.movementTime,
      this.busArrivalTime,
      this.createdAt,
      this.updatedAt});

  InternalMovements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservation_id'];
    movementDate = json['movement_date'];
    fromPlace = json['from_place'];
    toPlace = json['to_place'];
    movementTime = json['movement_time'];
    busArrivalTime = json['bus_arrival_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Bus {
  int? id;
  String? type;
  List<String>? images;
  int? categoryId;
  int? capacity;
  int? luggageCapacity;
  int? maxSpeed;
  bool? isAvailable;
  List<String>? features;
  String? createdAt;
  String? updatedAt;

  Bus(
      {this.id,
      this.type,
      this.images,
      this.categoryId,
      this.capacity,
      this.luggageCapacity,
      this.maxSpeed,
      this.isAvailable,
      this.features,
      this.createdAt,
      this.updatedAt});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    images = json['images'].cast<String>();
    categoryId = json['category_id'];
    capacity = json['capacity'];
    luggageCapacity = json['luggage_capacity'];
    maxSpeed = json['max_speed'];
    isAvailable = json['is_available'];
    features = json['features'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class BusRoute {
  int? id;
  int? busId;
  int? routeId;
  int? price;
  String? createdAt;
  String? updatedAt;

  BusRoute(
      {this.id,
      this.busId,
      this.routeId,
      this.price,
      this.createdAt,
      this.updatedAt});

  BusRoute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busId = json['bus_id'];
    routeId = json['route_id'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class BookingContact {
  int? id;
  int? userId;
  int? reservationId;
  String? driverPhone;
  String? createdAt;
  String? updatedAt;

  BookingContact(
      {this.id,
      this.userId,
      this.reservationId,
      this.driverPhone,
      this.createdAt,
      this.updatedAt});

  BookingContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    reservationId = json['reservation_id'];
    driverPhone = json['driver_phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
