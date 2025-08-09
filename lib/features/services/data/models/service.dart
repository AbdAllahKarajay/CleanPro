class Service {
  final int? id;
  final String name;
  final String description;
  final double basePrice;
  final int durationMinutes;
  final String? imageUrl;
  final String? category;

  const Service({
    this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.durationMinutes,
    this.imageUrl,
    this.category,
  });

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      id: map['id'] as int?,
      name: map['name'] as String? ?? 'Service',
      description: map['description'] as String? ?? 'Professional cleaning service',
      basePrice: (map['base_price'] as num?)?.toDouble() ?? 0.0,
      durationMinutes: map['duration_minutes'] as int? ?? 0,
      imageUrl: map['image_url'] as String?,
      category: map['category'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'base_price': basePrice,
      'duration_minutes': durationMinutes,
      if (imageUrl != null) 'image_url': imageUrl,
      if (category != null) 'category': category,
    };
  }

  @override
  String toString() {
    return 'Service(id: $id, name: $name, description: $description, basePrice: $basePrice, durationMinutes: $durationMinutes, imageUrl: $imageUrl, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Service &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.basePrice == basePrice &&
        other.durationMinutes == durationMinutes &&
        other.imageUrl == imageUrl &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        basePrice.hashCode ^
        durationMinutes.hashCode ^
        imageUrl.hashCode ^
        category.hashCode;
  }

  Service copyWith({
    int? id,
    String? name,
    String? description,
    double? basePrice,
    int? durationMinutes,
    String? imageUrl,
    String? category,
  }) {
    return Service(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }
} 