import 'package:messenger_app/bloc/contact_bloc/contact_bloc.dart';
import 'package:messenger_app/bloc/contact_bloc/contact_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'avatar.dart';

class ContactListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoadState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is ContactLoadedState) {
            return Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            var username = state.loadedContactlist?[index].username;
                        return Column(
                          children: [
                        ListTile(
                        leading: NameAvatar(fullName: username),
                            title: Column(
                            children: <Widget>[
                            SizedBox(
                            height: 5,
                            ),
                            Align(
                            alignment: Alignment.centerLeft,
                            child: Text(username,
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),),
                            ),
                            ],
                            ),
                            subtitle:
                            Text('${state.loadedContactlist?[index].email}', style: TextStyle(
                            fontSize: 17,
                            ),),
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 1.0,
                            ),
                          ],
                        );
                      },
                      childCount: state.loadedContactlist?.length,
                    )
                    )
                  ],

                )
            );
          }

          if (state is ContactErrorState) {
            return Center(
              child: Text('Что-то не так, проверьте интернет соединение!',
                style: TextStyle(fontSize: 20.0),),
            );
          }
          return SizedBox();
        }
    );

  }

}