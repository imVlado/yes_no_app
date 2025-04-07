import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(Text: "Hola Mundo", FromWho: FromWho.me),
    Message(Text: "Hola mundo", FromWho: FromWho.me),
  ];
}

