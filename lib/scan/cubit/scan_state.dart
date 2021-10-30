part of 'scan_cubit.dart';

class ScanState extends Equatable {
  final Product? product;

  final LoadStatus loadStatus;

  final Failure failure;
  ScanState({
    this.product,
    required this.loadStatus,
    required this.failure,
  });

  factory ScanState.initial() {
    return ScanState(loadStatus: LoadStatus.initial, failure: Failure());
  }

  @override
  List<Object?> get props => [
        product,
        loadStatus,
        failure,
      ];

  ScanState copyWith({
    Product? product,
    LoadStatus? loadStatus,
    Failure? failure,
  }) {
    return ScanState(
      product: product ?? this.product,
      loadStatus: loadStatus ?? this.loadStatus,
      failure: failure ?? this.failure,
    );
  }
}
