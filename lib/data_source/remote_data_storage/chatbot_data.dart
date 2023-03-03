import 'package:ai_dermatologist/app/constant.dart';
import 'package:dio/dio.dart';

import '../../helper/http_services.dart';

class ChatBotData{
    final Dio _httpServices = HttpServices().getDioInstance();

    Future<String> getResponse(String message) async{
      
        try{
            final Response response = await _httpServices.post(Constant.chatBot+Constant.message, data: {"message": message});
            if(response.statusCode != 200){
                return "Error";
            }else{
                return response.data["response"];
            }
        }catch(e){
            return "Error";
        }
    }

}