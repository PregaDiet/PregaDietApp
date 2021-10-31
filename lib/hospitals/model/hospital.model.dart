import 'dart:convert';

import 'package:equatable/equatable.dart';

class Hospital extends Equatable {
  final String name;
  final String address;
  final String map;
  final String phoneNumber;
  final double? rating;
  final String url;
  Hospital({
    required this.name,
    required this.address,
    required this.map,
    required this.phoneNumber,
    required this.rating,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'map': map,
      'phone_number': phoneNumber,
      'rating': rating,
      'url': url,
    };
  }

  factory Hospital.fromMap(Map<String, dynamic> map) {
    late final double? rating;
    if (map['rating'].runtimeType == String) {
      rating = null;
    } else {
      rating = (map['rating'] as num?)?.toDouble();
    }
    return Hospital(
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      map: map['map'] ?? '',
      phoneNumber: map['phone_number'] ?? '',
      rating: rating,
      url: map['url'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        map,
        phoneNumber,
        url,
      ];
}
