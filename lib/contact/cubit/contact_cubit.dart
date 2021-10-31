import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prega_diet/common/model/failure.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import '../repository/contact_repository.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit({required this.repository}) : super(ContactState.initial()) {
    getEmergencyContacts();
  }

  final ContactRepository repository;

  Future<void> getEmergencyContacts() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final contacts = await repository.getEmergencyContacts();

      emit(state.copyWith(
          loadStatus: LoadStatus.loaded, emergencyContacts: contacts));
    } catch (e, s) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.error,
          failure: Failure(e, s),
        ),
      );
    }
  }

  addContact(String contact) {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final updated = [...state.emergencyContacts, contact];

      repository.updateContacts(updated);

      emit(state.copyWith(
          loadStatus: LoadStatus.loaded, emergencyContacts: updated));
    } catch (e, s) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.error,
          failure: Failure(e, s),
        ),
      );
    }
  }

  removeContact(String contact) {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final updated = state.emergencyContacts
          .where((element) => element != contact)
          .toList();

      repository.updateContacts(updated);

      emit(state.copyWith(
          loadStatus: LoadStatus.loaded, emergencyContacts: updated));
    } catch (e, s) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.error,
          failure: Failure(e, s),
        ),
      );
    }
  }
}
