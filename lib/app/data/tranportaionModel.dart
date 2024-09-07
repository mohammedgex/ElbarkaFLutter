class tranportaionModel {
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
  List<transRoutes>? routes;

  tranportaionModel(
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
      this.updatedAt,
      this.routes});

  tranportaionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    images = List<String>.from(json['images']);
    categoryId = json['category_id'];
    capacity = json['capacity'];
    luggageCapacity = json['luggage_capacity'];
    maxSpeed = json['max_speed'];
    isAvailable = json['is_available'];
    features = json['features'].cast<String>();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['routes'] != null) {
      routes = <transRoutes>[];
      json['routes'].forEach((v) {
        routes!.add(transRoutes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    if (this.routes != null) {
      data['routes'] = this.routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class transRoutes {
  int? id;
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  transRoutes(
      {this.id,
      this.name,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  transRoutes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? busId;
  int? routeId;
  int? price;

  Pivot({this.busId, this.routeId, this.price});

  Pivot.fromJson(Map<String, dynamic> json) {
    busId = json['bus_id'];
    routeId = json['route_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bus_id'] = this.busId;
    data['route_id'] = this.routeId;
    data['price'] = this.price;
    return data;
  }
}
