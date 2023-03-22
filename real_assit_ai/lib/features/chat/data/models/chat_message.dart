import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String message;
  final String time;
  final bool isResponse;

  const ChatMessage({
    required this.message,
    required this.time,
    required this.isResponse,
  });

  @override
  List<Object?> get props => [message, time, isResponse];
}
