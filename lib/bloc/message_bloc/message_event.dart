import '../../models/message.dart';

abstract class MessageEvent {
}

class GetMessageEvent extends MessageEvent {
  final String contactId;

  GetMessageEvent({required this.contactId});
}

class SendMessageEvent extends MessageEvent {

  final Message message;
  SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'SendMessageEvent { message: $message }';
}