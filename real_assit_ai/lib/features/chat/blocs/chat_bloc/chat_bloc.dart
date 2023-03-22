
import 'dart:async';

import 'package:equatable/equatable.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:real_assit_ai/features/chat/data/repository/chat_repository.dart';

import '../../data/models/chat_message.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatRepository chatRepository;
  ChatBloc({required this.chatRepository}) : super(const ChatBlocState()) {
    on<OnAsking>(_onAsking);
  }

  FutureOr<void> _onAsking(
    OnAsking event,
    Emitter<ChatBlocState> emit,
  ) async {
    try {
      if (state.status == ChatStatus.initial) {
        final initialMessage = ChatMessage(
          message: event.ask,
          time: "5:00 PM",
          isResponse: false,
        );
        return emit(
          state.copyWith(
            status: ChatStatus.success,
            messages: List.of(state.messages)..add(initialMessage),
          ),
        );
      }
      final message = ChatMessage(
        message: event.ask,
        time: "5:00 PM",
        isResponse: false,
      );
      emit(
        state.copyWith(
          status: ChatStatus.success,
          messages: List.of(state.messages)..add(message),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ChatStatus.failure));
    }
  }
}
