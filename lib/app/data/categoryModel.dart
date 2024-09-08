class Category {
  final int id;
  final String name;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Bus> buses;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.buses,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      buses: List<Bus>.from(json['buses'].map((bus) => Bus.fromJson(bus))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'buses': buses.map((bus) => bus.toJson()).toList(),
    };
  }
}

class Bus {
  final int id;
  final String type;
  final List<String> images;
  final int categoryId;
  final int capacity;
  final int luggageCapacity;
  final int maxSpeed;
  final bool isAvailable;
  final List<String> features;
  final DateTime createdAt;
  final DateTime updatedAt;

  Bus({
    required this.id,
    required this.type,
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

  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      type: json['type'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'images': images,
      'category_id': categoryId,
      'capacity': capacity,
      'luggage_capacity': luggageCapacity,
      'max_speed': maxSpeed,
      'is_available': isAvailable,
      'features': features,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
