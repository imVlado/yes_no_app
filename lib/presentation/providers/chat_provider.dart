import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hoa", fromWho: FromWho.him), 
    Message(text: "sexo?", fromWho: FromWho.me),
    Message(text: "sexo?", fromWho: FromWho.him),
    Message(text: "sexo?", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {

    final newMessage = Message(text: text, fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    //notifica a provider que algo cambió
    notifyListeners();

  }

}



