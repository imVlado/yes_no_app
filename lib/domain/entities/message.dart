enum FromWho {me, him,}


//identidad atommica: la unidad mas pequeña de información que tiene sentido por si misma
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWho, 
    required String Text});



}