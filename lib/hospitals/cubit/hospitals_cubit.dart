import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../common/model/failure.dart';
import '../../common/model/load_status.enum.dart';
import '../model/hospital.model.dart';
import '../repository/hospitals_repository.dart';

part 'hospitals_state.dart';

class HospitalsCubit extends Cubit<HospitalsState> {
  HospitalsCubit({required this.repository}) : super(HospitalsState.initial()) {
    getHopitals();
  }

  HospitalsRepository repository;

  getHopitals() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final hospitals = await repository.getHospitals();

      emit(state.copyWith(loadStatus: LoadStatus.loaded, hospitals: hospitals));
    } catch (e, s) {
      emit(
          state.copyWith(loadStatus: LoadStatus.error, failure: Failure(e, s)));
    }
  }
}
