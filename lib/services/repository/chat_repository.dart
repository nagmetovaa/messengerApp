import 'package:messenger_app/models/message.dart';
import 'package:messenger_app/services/message_service.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {

  MessageService _messageService = MessageService();

  Future<void> sendMessage(String receiverId, String text) => _messageService.sendMessage(receiverId, text);

  Future<List<Message>> getMessages(String contactId) => _messageService.getMessages(contactId);

}
