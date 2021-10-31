import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prega_diet/common/model/failure.dart';
import 'package:prega_diet/common/model/load_status.enum.dart';
import 'package:prega_diet/contact/model/aasha_contact.dart';
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

  Future<void> addContact(String contact) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final updated = [...state.emergencyContacts, contact];

      await repository.updateContacts(updated);

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

  Future<void> removeContact(String contact) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final updated = state.emergencyContacts
          .where((element) => element != contact)
          .toList();

      await repository.updateContacts(updated);

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

  Future<void> notifyContacts(String name) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      await repository.notifyAll(name, state.emergencyContacts);
      emit(state.copyWith(loadStatus: LoadStatus.loaded));
    } catch (e, s) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.error,
          failure: Failure(e, s),
        ),
      );
    }
  }

  Future<AashaContact?> getAasha(String city) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final result = await repository.getAasha(city);
      if (result != null) {
        emit(state.copyWith(loadStatus: LoadStatus.loaded));
        return result;
      }
      emit(state.copyWith(loadStatus: LoadStatus.loaded));
    } catch (e, s) {
      emit(
          state.copyWith(failure: Failure(e, s), loadStatus: LoadStatus.error));
    }
  }
}
