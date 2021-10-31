import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String firstName;
  final String lastName;
  final String city;
  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.city,
  });

  factory UserDetails.initial() {
    return UserDetails(firstName: '', lastName: '', city: '');
  }

  UserDetails copyWith({
    String? firstName,
    String? lastName,
    String? city,
  }) {
    return UserDetails(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'city': city,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      firstName: map['firstName'],
      lastName: map['lastName'],
      city: map['city'],
    );
  }

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        city,
      ];
}
