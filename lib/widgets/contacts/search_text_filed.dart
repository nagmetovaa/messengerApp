import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/contact_bloc/contact_bloc.dart';
import '../../bloc/contact_bloc/contact_event.dart';


class SearchTextField extends StatelessWidget{

  final ValueNotifier<String> searchQueryNotifier;

  SearchTextField({required this.searchQueryNotifier});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ContactBloc bookBloc = BlocProvider.of<ContactBloc>(context);
    return CupertinoSearchTextField(
          controller: controller,
          autofocus: true,
          placeholder: 'Поиск',
          onChanged: (query) {
            // bookBloc.add(ContactEvent(controller.text));
            // searchQueryNotifier.value = query;
          },
    );
  }
}