import 'package:ai_dermatologist/data_source/remote_data_storage/reponse/disease_response.dart';
import 'package:ai_dermatologist/models/users.dart';

class Constant {
  static Users? users = Users();

  static String disease = "http://10.0.2.2:5000/";
  // static String disease = "http://192.168.0.11:5000/";
  static String predict = "api/predict";
  static String chatBot = "http://10.0.2.2:5001/";
  // static String chatBot = "http://192.168.0.11:5001/";  
  static String message = "api/send-message";
  static String voiceMessage = "api/send-voice-message";
  static String botSpeak = "api/speak";

  static DiseaseResponse diseaseResponse = DiseaseResponse();
}
