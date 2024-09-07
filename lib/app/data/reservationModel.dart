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
      this.bookingContact});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    if (json['arrival_departures'] != null) {
      arrivalDepartures = <ArrivalDepartures>[];
      json['arrival_departures'].forEach((v) {
        arrivalDepartures!.add(new ArrivalDepartures.fromJson(v));
      });
    }
    if (json['visits'] != null) {
      visits = <Visits>[];
      json['visits'].forEach((v) {
        visits!.add(new Visits.fromJson(v));
      });
    }
    if (json['internal_movements'] != null) {
      internalMovements = <InternalMovements>[];
      json['internal_movements'].forEach((v) {
        internalMovements!.add(new InternalMovements.fromJson(v));
      });
    }
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
    busRoute = json['bus_route'] != null
        ? new BusRoute.fromJson(json['bus_route'])
        : null;
    if (json['booking_contact'] != null) {
      bookingContact = <BookingContact>[];
      json['booking_contact'].forEach((v) {
        bookingContact!.add(new BookingContact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['bus_id'] = this.busId;
    data['bus_route_id'] = this.busRouteId;
    data['num_pilgrims'] = this.numPilgrims;
    data['num_buses'] = this.numBuses;
    data['umrah_company'] = this.umrahCompany;
    data['mecca_hotel_name'] = this.meccaHotelName;
    data['medina_hotel_name'] = this.medinaHotelName;
    data['reservation_status'] = this.reservationStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.arrivalDepartures != null) {
      data['arrival_departures'] =
          this.arrivalDepartures!.map((v) => v.toJson()).toList();
    }
    if (this.visits != null) {
      data['visits'] = this.visits!.map((v) => v.toJson()).toList();
    }
    if (this.internalMovements != null) {
      data['internal_movements'] =
          this.internalMovements!.map((v) => v.toJson()).toList();
    }
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    if (this.busRoute != null) {
      data['bus_route'] = this.busRoute!.toJson();
    }
    if (this.bookingContact != null) {
      data['booking_contact'] =
          this.bookingContact!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reservation_id'] = this.reservationId;
    data['user_id'] = this.userId;
    data['amount'] = this.amount;
    data['payment_status'] = this.paymentStatus;
    data['remaining_amount'] = this.remainingAmount;
    data['payment_type'] = this.paymentType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reservation_id'] = this.reservationId;
    data['date'] = this.date;
    data['time'] = this.time;
    data['flight_number'] = this.flightNumber;
    data['airline'] = this.airline;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reservation_id'] = this.reservationId;
    data['visit_date'] = this.visitDate;
    data['from_place'] = this.fromPlace;
    data['to_place'] = this.toPlace;
    data['movement_time'] = this.movementTime;
    data['bus_arrival_time'] = this.busArrivalTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reservation_id'] = this.reservationId;
    data['movement_date'] = this.movementDate;
    data['from_place'] = this.fromPlace;
    data['to_place'] = this.toPlace;
    data['movement_time'] = this.movementTime;
    data['bus_arrival_time'] = this.busArrivalTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['images'] = this.images;
    data['category_id'] = this.categoryId;
    data['capacity'] = this.capacity;
    data['luggage_capacity'] = this.luggageCapacity;
    data['max_speed'] = this.maxSpeed;
    data['is_available'] = this.isAvailable;
    data['features'] = this.features;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bus_id'] = this.busId;
    data['route_id'] = this.routeId;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['reservation_id'] = this.reservationId;
    data['driver_phone'] = this.driverPhone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
