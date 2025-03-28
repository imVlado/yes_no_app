import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_filed_box.dart';


class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://s3p.sofifa.net/7302ecffa6abbc02c537a4824be4db1b8d1edd19.jpg"),
          ),
        ),
        title: const Text("Bellingham"),
        centerTitle: false,
      ),
      body: _ChatView(),
      
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column (
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:100,
                itemBuilder: (context, index) {
                  return(index % 2 == 0) 
                    ? const MyMessageBubble()
                    : const HisMessageBubble();

              },),
            ),
            MessageFiledBox(),
          
           ],
        ),
      ),
    );
  }
}