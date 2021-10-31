part of 'contact_cubit.dart';

class ContactState extends Equatable {
  final List<String> emergencyContacts;
  final LoadStatus loadStatus;
  final Failure failure;

  const ContactState({
    required this.emergencyContacts,
    required this.loadStatus,
    required this.failure,
  });

  factory ContactState.initial() {
    return const ContactState(
      emergencyContacts: [],
      loadStatus: LoadStatus.initial,
      failure: Failure(),
    );
  }

  @override
  List<Object?> get props => [
        emergencyContacts,
        loadStatus,
        failure,
      ];

  ContactState copyWith({
    List<String>? emergencyContacts,
    LoadStatus? loadStatus,
    Failure? failure,
  }) {
    return ContactState(
      emergencyContacts: emergencyContacts ?? this.emergencyContacts,
      loadStatus: loadStatus ?? this.loadStatus,
      failure: failure ?? this.failure,
    );
  }
}
