class Favoritemodel {
  int? id;
  String? type;
  String? description;
  String? companyName;
  List<String>? images;
  int? categoryId;
  int? capacity;
  int? luggageCapacity;
  int? maxSpeed;
  bool? isAvailable;
  List<String>? features;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Favoritemodel({
    this.id,
    this.type,
    this.description,
    this.companyName,
    this.images,
    this.categoryId,
    this.capacity,
    this.luggageCapacity,
    this.maxSpeed,
    this.isAvailable,
    this.features,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  Favoritemodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
    companyName = json['compnay_name'];
    images = List<String>.from(json['images']);
    categoryId = json['category_id'];
    capacity = json['capacity'];
    luggageCapacity = json['luggage_capacity'];
    maxSpeed = json['max_speed'];
    isAvailable = json['is_available'];
    features = List<String>.from(json['features']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    data['compnay_name'] = this.companyName;
    data['images'] = this.images;
    data['category_id'] = this.categoryId;
    data['capacity'] = this.capacity;
    data['luggage_capacity'] = this.luggageCapacity;
    data['max_speed'] = this.maxSpeed;
    data['is_available'] = this.isAvailable;
    data['features'] = this.features;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? busId;

  Pivot({this.userId, this.busId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    busId = json['bus_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['bus_id'] = this.busId;
    return data;
  }
}
