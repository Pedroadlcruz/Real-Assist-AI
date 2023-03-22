import 'package:flutter/material.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

import '../../../core/constants/assets.dart';
import '../../../core/constants/strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/side_menu_header.dart';
import '../../subcription/presentation/subscription_screen.dart';

class LoggenInChatScreen extends StatelessWidget {
  const LoggenInChatScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF5F6FA,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 64.dH,
        leadingWidth: 40.dW,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.color292D32,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Scaffold(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  body: const SideMenuHeader(),
                );
              },
            );
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Real Assist AI', style: TextStyles.boldLarge18),
            Text('This is private message, between you and Assistant.',
                style: TextStyles.tiny12),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.dW),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 31.dH, bottom: 16.dH),
              child: Text('Example of types of question to ask RealAssist',
                  style: TextStyles.boldHuge24),
            ),
            ...Strings.cardTexts.map(
              (text) => _LoggenInCard(text: text),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 8.dH),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175.dW, 54.dH),
                    backgroundColor: AppColors.color272679,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.dW),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SubscriptionScreen.routeName);
                  },
                  child: Text(
                    "Subscribe",
                    style: TextStyles.boldLarge18.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
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
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 18.dH, bottom: 15.dH, left: 14.dW, right: 40.dW),
                      child: Text(
                        'What can I assist you with?',
                        style: TextStyles.hintText,
                      ),
                    ),
                  ),
                  Container(
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LoggenInCard extends StatelessWidget {
  const _LoggenInCard({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 65.dH),
      padding: EdgeInsets.only(right: 10.dW),
      margin: EdgeInsets.only(top: 8.dH),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.dW),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 14.dH, bottom: 15.dH, left: 21.dW, right: 40.dW),
              child: Text(text, style: TextStyles.boldSmall14),
            ),
          ),
          Icon(
            Icons.arrow_outward,
            size: 24.dW,
            color: AppColors.secondaryColor,
          )
        ],
      ),
    );
  }
}
