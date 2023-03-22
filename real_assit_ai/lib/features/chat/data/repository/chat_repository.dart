import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:real_assit_ai/core/errors/api_exeptions.dart';

import '../../../../core/constants/endpoints.dart';
import '../../../../core/services/network_info_service.dart';
import '../models/assit_response_model.dart';

class ChatRepository {
  ChatRepository({required this.networkInfo, http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  final http.Client _httpClient;
  final NetworkInfoService networkInfo;
  Future<String?> createChatCompletion(String msg) async {
    // Check if device have wifi or mobile data
    if (await networkInfo.isConnected) {
      throw ApiException(msg: "Please, check your internet conection");
    }
    try {
      final chatRequest = Uri.https(
        dotenv.get('OPENAI_API_URL'),
        Endpoints.chatCompletion,
      );
      final requestHeaders = {
        HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
        HttpHeaders.authorizationHeader:
            "Bearer ${dotenv.get('OPENAI_SECRET_KEY')}",
      };
      final requestBody = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": msg}
        ]
      };

      final response = await _httpClient.post(
        chatRequest,
        headers: requestHeaders,
        body: jsonEncode(requestBody),
      );
      if (response.statusCode == 200) {
        final assistResponseModel = assistResponseModelFromJson(response.body);
        return assistResponseModel.choices?[0].message?.content;
      }
    } on Exception catch (_) {
      throw ApiException(msg: "An unexpected error has occurred");
    }
    return null;
  }
}
