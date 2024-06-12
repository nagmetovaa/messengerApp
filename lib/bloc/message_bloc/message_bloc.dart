import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger_app/bloc/message_bloc/message_state.dart';
import 'package:messenger_app/bloc/message_bloc/message_event.dart';
import 'package:messenger_app/services/repository/chat_repository.dart';


class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final ChatRepository _chatRepository;

  MessageBloc(this._chatRepository) : super(MessageEmptyState()) {
    on<GetMessageEvent>(_onGetMessages);
  }

  void _onGetMessages(GetMessageEvent event, Emitter<MessageState> emit) async {
    try {
      emit(MessageLoadState());
      final messages = await _chatRepository.getMessages(event.contactId);
      emit(MessageLoadedState(loadedMessage: messages));
    } catch (e) {
      emit(MessageErrorState(e.toString()));
    }
  }
}


