import 'dart:async';

import 'package:equatable/equatable.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:intl/intl.dart';
import 'package:real_assit_ai/core/constants/strings.dart';
import 'package:real_assit_ai/features/chat/data/repository/chat_repository.dart';

import '../../../../core/errors/api_exeptions.dart';
import '../../data/models/chat_message.dart';

part 'chat_bloc_event.dart';
part 'chat_bloc_state.dart';

class ChatBloc extends Bloc<ChatBlocEvent, ChatBlocState> {
  final ChatRepository chatRepository;
  ChatBloc({required this.chatRepository}) : super(const ChatBlocState()) {
    on<SendWelcomeMsg>(_onSendWelcomeMsg);
    on<UserQueryChanged>(_onUserQueryChanged);
    on<ChatSubmitted>(_onChatSubmitted);
  }

  bool validateChatQuery() {
    return state.query.trim().isNotEmpty && state.query.length >= 5;
  }

  bool validateResponseLimit() {
    return state.responses >= 5;
  }

  FutureOr<void> _onSendWelcomeMsg(
    SendWelcomeMsg event,
    Emitter<ChatBlocState> emit,
  ) async {
    if (state.status == ChatStatus.initial) {
      final initialMessage = ChatMessage(
        message: Strings.chatInitialMsg,
        time: DateFormat('jm').format(DateTime.now()),
        isResponse: false,
      );
      return emit(
        state.copyWith(
          status: ChatStatus.success,
          messages: List.of(state.messages)..add(initialMessage),
        ),
      );
    }
  }

  FutureOr<void> _onUserQueryChanged(
    UserQueryChanged event,
    Emitter<ChatBlocState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
      ),
    );
  }

  FutureOr<void> _onChatSubmitted(
    ChatSubmitted event,
    Emitter<ChatBlocState> emit,
  ) async {
    if (validateChatQuery()) {
      try {
        final message = ChatMessage(
          message: state.query,
          time: DateFormat('jm').format(DateTime.now()),
          isResponse: false,
        );
        emit(
          state.copyWith(
            status: ChatStatus.loading,
            messages: List.of(state.messages)..add(message),
          ),
        );
        final response = await chatRepository.createChatCompletion(state.query);
        final responseMessage = ChatMessage(
          message: response ?? "Empty response",
          time: DateFormat('jm').format(DateTime.now()),
          isResponse: true,
        );
        emit(
          state.copyWith(
            status: ChatStatus.success,
            messages: List.of(state.messages)..add(responseMessage),
            query: "",
            responses: state.responses + 1,
          ),
        );
      } on ApiException catch (e) {
        emit(state.copyWith(status: ChatStatus.failure, failureMsg: e.msg));
        emit(state.copyWith(status: ChatStatus.success, failureMsg: ""));
      }
    }
  }
}
