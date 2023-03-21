import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/endpoints.dart';
import '../models/assit_response_model.dart';

class ChatRepository {
  ChatRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();
  final http.Client _httpClient;

  Future<String?> createChatCompletion(String msg) async {
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
      // print(response.body);
      final assistResponseModel = assistResponseModelFromJson(response.body);
      // print(assistResponseModel.choices?[0].message?.content);
      return assistResponseModel.choices?[0].message?.content;
    } catch (e) {
      throw Exception("Unexpected error");
    }
  }
}
