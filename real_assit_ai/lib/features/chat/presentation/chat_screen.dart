import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

import '../../../core/constants/assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';

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
              child: ListView(
            children: [
              SizedBox(height: 30.dH),
              const _ChatBubble(
                msg: 'Hey, this  Real Assist AI, How I can help you?',
                isResponse: false,
              ),
              const _ChatBubble(
                msg:
                    'How do I share property descriptions with my clients in the most effective way',
                isResponse: true,
              ),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(top: 7.dH, bottom: 15.dH),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 285.dW,
                  constraints: BoxConstraints(minHeight: 53.dH),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.dW),
                    ),
                  ),
                  child: TextField(
                    decoration: _buildInputDecoration(),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45.dW,
                    width: 45.dW,
                    margin: EdgeInsets.only(left: 11.dW),
                    padding: EdgeInsets.all(10.dW),
                    decoration: const BoxDecoration(
                      color: AppColors.secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppImages.send,
                      height: 22.5.dW,
                      width: 22.5.dW,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
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
  const _ChatBubble({required this.msg, required this.isResponse});
  final String msg;
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
              '08:30 pm',
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
