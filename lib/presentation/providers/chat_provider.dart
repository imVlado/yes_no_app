import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: "Hola", fromWho: FromWho.him), 
    Message(text: "sexo?", fromWho: FromWho.me),
    Message(text: "no", fromWho: FromWho.him),
    Message(text: ":(", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista, no permite mensajes vacíos
    messageList.add(newMessage);
    print("Cantidad de mensajes: ${messageList.length}");


    //notifica a provider que algo cambió
    notifyListeners();

    moveScrollToBottom();

  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      //desplazarse hasta el final
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      //rebote
      curve: Curves.easeInOutCubicEmphasized,
    );
  
  }

}



