import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc/contact_bloc.dart';
import '../services/repository/contact_repository.dart';
import '../widgets/contacts/list_view_contacts.dart';
import '../widgets/contacts/search_text_filed.dart';

class ContactList extends StatefulWidget {

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {

  final contactRepository = ContactRepository();
  final searchQueryNotifier = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(contactRepository),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 10.0)),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 5.0)),
                Text('Чаты',
                  style: const TextStyle(fontSize: 22, height: 3),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:  SearchTextField(searchQueryNotifier: searchQueryNotifier,),
            ),
            ContactListView(),
          ],
        ),
      ),
    );

  }
  }