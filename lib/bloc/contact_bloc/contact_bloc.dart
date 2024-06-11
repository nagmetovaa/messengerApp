import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/contact_bloc/contact_event.dart';
import 'package:messenger_app/bloc/contact_bloc/contact_state.dart';
import 'package:messenger_app/models/contact.dart';
import 'package:messenger_app/services/repository/contact_repository.dart';


class ContactBloc extends Bloc<ContactEvent, ContactState> {

  final ContactRepository contactRepository;
  ContactBloc(this.contactRepository) : super(ContactLoadState()) {
    initialize();
  }



  void initialize() async {
    try {
      final List<Contact> _contactList = await contactRepository.getContactList();
      emit(ContactLoadedState(loadedContactlist: _contactList));
    } catch (e) {
      emit(ContactErrorState());
      print('${e}');
    }
  }

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async*{
    if (event is ContactEvent) {
      try{
        final List<Contact> _contactList = await contactRepository.getContactList();
        yield ContactLoadedState(loadedContactlist: _contactList);
      }catch (e) {
        yield ContactErrorState();
        print('${e}');
      }
    }
  }
}