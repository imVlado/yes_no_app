import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  //Instancia de la clase Dio
  final _dio = Dio();
  Future<Message> getAnswer() async{
    //Almacenar el resultad de la peticion
    final response = await _dio.get("https://yesno.wtf/api");

     //Almacenar el resultado de la peticion
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //Retornar la instancia de messahe
    return yesNoModel.toMessageEntity();
  }
}