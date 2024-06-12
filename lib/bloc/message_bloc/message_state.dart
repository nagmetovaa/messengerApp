abstract class MessageState{}

class MessageEmptyState extends MessageState{}

class MessageLoadState extends MessageState {}

class MessageLoadedState extends MessageState {
  List <dynamic>? loadedMessage;
  MessageLoadedState({required this.loadedMessage}) : assert(loadedMessage != null);
}
class MessageErrorState extends MessageState {
  final String errorMessage;
  MessageErrorState(this.errorMessage);
}

