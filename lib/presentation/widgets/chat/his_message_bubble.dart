import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HisMessageBubble extends StatelessWidget {
  final Message message;
  const HisMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Container(
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(message.text, style: TextStyle(color: Colors.white, fontSize: 17), ),
        ),
        
        ),
      const SizedBox(height: 5.0),

      _ImageBubble(),


    ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return  ClipRRect(
      borderRadius : BorderRadius.circular(20),
      child: Image.network(
        "https://yesno.wtf/assets/no/17-829284e9dd894ce9fb65fbe86d2e382c.gif",
        width: size.width * 0.5,
        height: 170,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.5,
            height: 170,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SizedBox(
              width: 20,
              height: 20,
              child: const Text('Bellingham esta enviando una imagen...' ,
              style: TextStyle(color: Colors.black, fontSize: 17),),

            ),
          );
        },
      ));
  }
}