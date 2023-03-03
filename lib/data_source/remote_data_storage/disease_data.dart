import 'dart:io';

import 'package:ai_dermatologist/app/constant.dart';
import 'package:ai_dermatologist/data_source/remote_data_storage/reponse/disease_response.dart';
import 'package:ai_dermatologist/helper/http_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:mime/mime.dart';

class DiseaseData {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> predictDisease(File? file) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', mimeType!.split('/').last));
      }
      FormData imageData = FormData.fromMap({
        'file': file != null ? await MultipartFile.fromFile(file.path) : "",
      });

      final Response response = await _httpServices.post(
        Constant.predict,
        data: imageData,
      );
      if (response.statusCode != 200) {
        return 0;
      } else {
        DiseaseResponse diseaseResponse =
            DiseaseResponse.fromJson(response.data);
        Constant.diseaseResponse = DiseaseResponse.fromJson(response.data);
        return 1;
      }
    } catch (e) {
      return 0;
    }
  }
}
