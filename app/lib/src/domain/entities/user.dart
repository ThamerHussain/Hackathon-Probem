class User {
  final String id;
  final String name;
  final String role;
  final String? fingerPrintId;
  final String? imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.role,
    this.fingerPrintId,
    this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      fingerPrintId: json['fingerPrintId']?.toString(),
      imageUrl: json['imageUrl']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
      'fingerPrintId': fingerPrintId,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, role: $role, fingerPrintId: $fingerPrintId)';
  }
}
