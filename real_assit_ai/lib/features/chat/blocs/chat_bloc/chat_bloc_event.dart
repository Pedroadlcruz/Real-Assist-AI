part of 'chat_bloc.dart';

abstract class ChatBlocEvent extends Equatable {
  const ChatBlocEvent();
  @override
  List<Object?> get props => [];
}

class SendWelcomeMsg extends ChatBlocEvent {
  const SendWelcomeMsg();
}

class UserQueryChanged extends ChatBlocEvent {
  const UserQueryChanged(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

class ChatSubmitted extends ChatBlocEvent {
  const ChatSubmitted();
}
