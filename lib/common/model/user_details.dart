import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String firstName;
  final String lastName;
  UserDetails({
    required this.firstName,
    required this.lastName,
  });

  factory UserDetails.initial() {
    return UserDetails(firstName: '', lastName: '');
  }

  UserDetails copyWith({
    String? firstName,
    String? lastName,
  }) {
    return UserDetails(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  @override
  List<Object?> get props => [firstName, lastName];
}
