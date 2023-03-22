import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

import '../../../core/constants/assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/alerts.dart';
import '../blocs/chat_bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const String routeName = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF5F6FA,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 64.dH,
        leadingWidth: 40.dW,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.dW),
          child: Icon(
            Icons.menu,
            color: AppColors.color292D32,
            size: 30.dW,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: BlocListener<ChatBloc, ChatBlocState>(
              listener: (context, state) {
                if (state.status == ChatStatus.failure) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.failureMsg)));
                }
              },
              child: BlocBuilder<ChatBloc, ChatBlocState>(
                builder: (BuildContext context, state) {
                  switch (state.status) {
                    case ChatStatus.failure:
                    case ChatStatus.initial:
                      return const Center(child: CircularProgressIndicator());
                    case ChatStatus.loading:
                    case ChatStatus.success:
                      return ListView.builder(
                        itemCount: state.messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _ChatBubble(
                            msg: state.messages[index].message,
                            isResponse: state.messages[index].isResponse,
                            hour: state.messages[index].time,
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ),
          const _ChatInput()
        ],
      ),
    );
  }
}

class _ChatInput extends StatefulWidget {
  const _ChatInput();

  @override
  State<_ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<_ChatInput> {
  late TextEditingController _chatInputController;
  @override
  void initState() {
    _chatInputController = TextEditingController(text: "");
    super.initState();
  }

  @override
  void dispose() {
    _chatInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 7.dH, bottom: 15.dH),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<ChatBloc, ChatBlocState>(
            builder: (context, state) {
              return Container(
                width: 285.dW,
                constraints: BoxConstraints(minHeight: 53.dH),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.dW),
                  ),
                ),
                child: TextField(
                  controller: _chatInputController,
                  decoration: _buildInputDecoration()
                      .copyWith(enabled: state.status == ChatStatus.success),
                  onChanged: (query) =>
                      context.read<ChatBloc>().add(UserQueryChanged(query)),
                  onSubmitted: (_) => _summit(state, context),
                ),
              );
            },
          ),
          BlocBuilder<ChatBloc, ChatBlocState>(
            builder: (context, state) {
              return InkWell(
                onTap: () => _summit(state, context),
                child: Container(
                  height: 45.dW,
                  width: 45.dW,
                  margin: EdgeInsets.only(left: 11.dW),
                  padding: EdgeInsets.all(10.dW),
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: state.status != ChatStatus.success
                      ? const CircularProgressIndicator()
                      : Image.asset(
                          AppImages.send,
                          height: 22.5.dW,
                          width: 22.5.dW,
                          fit: BoxFit.cover,
                        ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _summit(ChatBlocState state, BuildContext context) {
    final hasFreeResponses = context.read<ChatBloc>().validateResponseLimit();
    if (hasFreeResponses) {
      Alerts.alertDialog(
          context: context,
          content: "You have consumed the maximum number of free responses",
          onOk: () {
            Navigator.of(context)
              ..pop()
              ..pop();
          });
    }
    final isValidQuery = context.read<ChatBloc>().validateChatQuery();
    if (state.status == ChatStatus.success && isValidQuery) {
      context.read<ChatBloc>().add(const ChatSubmitted());
      _chatInputController.clear();
      _dismissKeyboard();
    }
  }

  void _dismissKeyboard() {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.dW)),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.dW)),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.dW)),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.dW)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.dW)),
      ),
      hintText: 'What can I assist you with?',
      hintStyle: TextStyles.hintText,
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble(
      {required this.msg, required this.isResponse, required this.hour});
  final String msg;
  final String hour;
  final bool isResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isResponse ? Colors.white : AppColors.colorF5F6FA,
      padding: EdgeInsets.symmetric(horizontal: 42.dW, vertical: 17.dH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            msg,
            style: GoogleFonts.manrope(
              fontSize: 12.78.fS,
              color: AppColors.color555B67,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.dH),
            child: Text(
              hour,
              style: GoogleFonts.manrope(
                fontSize: 12.fS,
                color: AppColors.color9BA1AE,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
