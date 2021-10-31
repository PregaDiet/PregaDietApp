import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../common/model/failure.dart';
import '../../common/model/load_status.enum.dart';
import '../model/product.model.dart';
import '../repository/scan_repository.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({required this.repository}) : super(ScanState.initial());

  ScanRepository repository;

  Future<void> scanProduct() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final product = await repository.getProductInfo();
      if (product != null) {
        emit(state.copyWith(loadStatus: LoadStatus.loaded, product: product));
      } else {
        emit(ScanState.initial());
      }
    } catch (e, s) {
      emit(
          state.copyWith(loadStatus: LoadStatus.error, failure: Failure(e, s)));
    }
  }
}
