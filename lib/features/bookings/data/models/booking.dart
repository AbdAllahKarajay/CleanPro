import '../../../services/data/models/service.dart';

class Booking {
  final int? id;
  final Service service;
  final DateTime scheduledAt;
  final String address;
  final String status;
  final String? specialInstructions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Booking({
    this.id,
    required this.service,
    required this.scheduledAt,
    required this.address,
    required this.status,
    this.specialInstructions,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      id: map['id'] as int?,
      service: Service.fromMap(map['service'] as Map<String, dynamic>),
      scheduledAt: DateTime.parse(map['scheduled_at'] as String),
      address: map['address'] as String? ?? '',
      status: map['status'] as String? ?? 'pending',
      specialInstructions: map['special_instructions'] as String?,
      createdAt: map['created_at'] != null 
          ? DateTime.parse(map['created_at'] as String)
          : null,
      updatedAt: map['updated_at'] != null 
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'service': service.toMap(),
      'scheduled_at': scheduledAt.toIso8601String(),
      'address': address,
      'status': status,
      if (specialInstructions != null) 'special_instructions': specialInstructions,
      if (createdAt != null) 'created_at': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updated_at': updatedAt!.toIso8601String(),
    };
  }

  String get formattedDate {
    return '${scheduledAt.year}-${scheduledAt.month.toString().padLeft(2, '0')}-${scheduledAt.day.toString().padLeft(2, '0')}';
  }

  String get formattedTime {
    return '${scheduledAt.hour.toString().padLeft(2, '0')}:${scheduledAt.minute.toString().padLeft(2, '0')}';
  }

  String get formattedPrice {
    return '\$${service.basePrice}';
  }

  @override
  String toString() {
    return 'Booking(id: $id, service: $service, scheduledAt: $scheduledAt, address: $address, status: $status, specialInstructions: $specialInstructions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Booking &&
        other.id == id &&
        other.service == service &&
        other.scheduledAt == scheduledAt &&
        other.address == address &&
        other.status == status &&
        other.specialInstructions == specialInstructions &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        service.hashCode ^
        scheduledAt.hashCode ^
        address.hashCode ^
        status.hashCode ^
        specialInstructions.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  Booking copyWith({
    int? id,
    Service? service,
    DateTime? scheduledAt,
    String? address,
    String? status,
    String? specialInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Booking(
      id: id ?? this.id,
      service: service ?? this.service,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      address: address ?? this.address,
      status: status ?? this.status,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
} 