class DonationItem {
  final String id;
  final String donorId; // ID of the donor donating the item
  final String name; // Name of the item being donated
  final String category; // Type of donation (food, clothes, etc.)
  final String? description; // Optional details about the item
  final double quantity; // Quantity of the item being donated
  final String? condition;
  final double latitude; // Latitude of the donation location
  final double longitude; // Longitude of the donation location

  final String status; // Available / Accepted
  final String? ngoId; // ID of the NGO accepting  the donation
  final String? imageUrl;
  final DateTime createdAt;

  DonationItem({
    required this.id,

    required this.donorId,
    required this.name,
    required this.category,
    this.description,
    required this.quantity,
    this.condition,
    required this.latitude,
    required this.longitude,
    required this.status,
    this.ngoId,
    this.imageUrl,
    required this.createdAt,
  });
  factory DonationItem.fromJson(Map<String, dynamic> json) {
    return DonationItem(
      id: json['id'],
      donorId: json['donorId'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      quantity: (json['quantity'] as num).toDouble(),
      condition: json['condition'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      status: json['status'],
      ngoId: json['ngoId'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'donorId': donorId,
      'name': name,
      'category': category,
      'description': description,
      'quantity': quantity,
      'condition': condition,
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'ngoId': ngoId,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
