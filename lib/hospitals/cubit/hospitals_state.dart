part of 'hospitals_cubit.dart';

class HospitalsState extends Equatable {
  final List<Hospital> hospitals;

  final LoadStatus loadStatus;
  final Failure failure;
  HospitalsState({
    required this.hospitals,
    required this.loadStatus,
    required this.failure,
  });

  factory HospitalsState.initial() {
    return HospitalsState(
      hospitals: [],
      loadStatus: LoadStatus.initial,
      failure: Failure(),
    );
  }

  @override
  List<Object> get props => [
        hospitals,
        loadStatus,
        failure,
      ];

  HospitalsState copyWith({
    List<Hospital>? hospitals,
    LoadStatus? loadStatus,
    Failure? failure,
  }) {
    return HospitalsState(
      hospitals: hospitals ?? this.hospitals,
      loadStatus: loadStatus ?? this.loadStatus,
      failure: failure ?? this.failure,
    );
  }
}
