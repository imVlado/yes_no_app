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
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(message.text,
            style: TextStyle(color: Colors.white, fontSize: 17), ),
        ),
        
        ),
      const SizedBox(height: 5.0),
      //!: siempre muestra una imagen
      _ImageBubble(imageUrl: message.imageUrl!),
      const SizedBox(height: 10.0),


    ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return  ClipRRect(
      borderRadius : BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
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