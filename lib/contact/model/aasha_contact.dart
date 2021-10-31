class AashaContact {
  final String name;
  final String phone;
  AashaContact({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
    };
  }

  factory AashaContact.fromMap(Map<String, dynamic> map) {
    return AashaContact(
      name: map['name'],
      phone: map['phone'],
    );
  }
}
