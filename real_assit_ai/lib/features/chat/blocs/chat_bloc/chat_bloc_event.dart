part of 'chat_bloc.dart';

abstract class ChatBlocEvent extends Equatable {
  const ChatBlocEvent();
  @override
  List<Object?> get props => [];
}

class OnAsking extends ChatBlocEvent {
  final String ask;
  const OnAsking(this.ask);
  @override
  List<Object?> get props => [ask];
}
