// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatBlocState extends Equatable {
  const ChatBlocState({
    this.status = ChatStatus.initial,
    this.messages = const <ChatMessage>[],
    this.responses = 0,
    this.query = "",
  });
  final ChatStatus status;
  final List<ChatMessage> messages;
  final int responses;
  final String query;

  @override
  List<Object?> get props => [status, messages, responses, query];

  ChatBlocState copyWith({
    ChatStatus? status,
    List<ChatMessage>? messages,
    int? responses,
    String? query,
  }) {
    return ChatBlocState(
      status: status ?? this.status,
      messages: messages ?? this.messages,
      responses: responses ?? this.responses,
      query: query ?? this.query,
    );
  }
}
