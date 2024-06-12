import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/message_bloc/message_bloc.dart';
import '../bloc/message_bloc/message_event.dart';
import '../bloc/message_bloc/message_state.dart';
import '../services/repository/chat_repository.dart';
import '../widgets/messages/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  late final String contact;
  late final String fullName;

  ChatScreen({required this.contact, required this.fullName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  ChatRepository chatRepository = ChatRepository();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    chatRepository = ChatRepository();
    context.read<MessageBloc>().add(GetMessageEvent(contactId: widget.contact));
  }

  @override
  Widget build(BuildContext context) {
    final messageBloc = BlocProvider.of<MessageBloc>(context);
    messageBloc.add(GetMessageEvent(contactId: widget.contact));
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fullName),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          print('1');
          if (state is MessageLoadState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MessageLoadedState) {
            return Column(
              children: [
              Expanded(
                  child: ListView.builder(
                    reverse: true,
                    itemCount: state.loadedMessage?.length,
                    itemBuilder: (context, index) {
                      final message = state.loadedMessage?[index];
                      final isMe = message.senderId == FirebaseAuth.instance.currentUser?.uid;
                      return MessageBubble(
                        message: message.text,
                        isMe: isMe,
                      );
                    },
                  ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            hintText: 'Введите сообщение...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          _sendMessage(context, widget.contact);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is MessageErrorState) {
            print(state.errorMessage);
            return Center(child: Text(state.errorMessage));
          } else {
            return Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }

  void _sendMessage(BuildContext context, String receiverId) {
    final messageText = _messageController.text.trim();

    chatRepository.sendMessage(receiverId, messageText);
    final messageBloc = BlocProvider.of<MessageBloc>(context);
    messageBloc.add(GetMessageEvent(contactId: widget.contact));
      _messageController.clear();

  }
}
