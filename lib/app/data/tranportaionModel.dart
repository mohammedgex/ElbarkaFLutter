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
  String? description; // إضافة الوصف
  String? compnay_name; // إضافة اسم الشركة
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
      this.description, // تعيين الوصف
      this.compnay_name, // تعيين اسم الشركة
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
    description = json['description']; // إضافة الوصف من JSON
    compnay_name = json['compnay_name']; // إضافة اسم الشركة من JSON
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['routes'] != null) {
      routes = <transRoutes>[];
      json['routes'].forEach((v) {
        routes!.add(transRoutes.fromJson(v));
      });
    }
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
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
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
}
