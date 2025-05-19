import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helper/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //Agregar un nuevo mensaje a la lista, no permite mensajes vacíos
    messageList.add(newMessage);

    //detectar si el usuario hizo una pregunta
    if (text.endsWith("?")) {
      //si el mensaje termina en ? entonces se llama a la funcion de respuesta
      await hisReply();
    } else {
      //si no, se agrega un mensaje de respuesta por defecto
      messageList.add( Message(text: "No tengo respuesta para eso", fromWho: FromWho.him));
    }


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
  //crear la respuesta de el
  Future<void> hisReply() async{
    //Obtener el mensaje de la peticion HTTP
    final hisMessage = await getYesNoAnswer.getAnswer();

    //Añadimos los mensajes de ella a la lista de mensajes
    messageList.add(hisMessage);

    //notifica a provider que algo cambió
    notifyListeners();
    //desplazarse hasta el final
    moveScrollToBottom();
  }
}



