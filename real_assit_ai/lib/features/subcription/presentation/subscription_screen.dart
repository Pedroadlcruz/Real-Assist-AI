import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_assit_ai/core/constants/strings.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';
import 'package:real_assit_ai/features/auth/presentation/loggen_in_chat_screen.dart';

import '../../../core/constants/assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/widgets/side_menu_header.dart';
import '../../chat/presentation/chat_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});
  static const String routeName = 'subscription_screen';

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
                  backgroundColor: AppColors.primaryColor,
                  body: Column(
                    children: [
                      const SideMenuHeader(),
                      Padding(
                        padding: EdgeInsets.only(top: 487.dH, bottom: 45.dH),
                        child: Divider(
                            height: 0.5.dH, color: AppColors.colorF5F6FA),
                      ),
                      ...Strings.sideMenuOptions.map(
                        (option) => _SideMenuOption(
                          text: option,
                          onTap: () {
                            if (option == "Logout") {
                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  LoggenInChatScreen.routeName,
                                  (route) => false);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
              padding: EdgeInsets.only(top: 31.dH, bottom: 24.dH),
              child: Text(
                'The Right Clauses Every Time: Generate Custom Legal Clauses with RealAssist.AI',
                style: GoogleFonts.manrope(
                  fontSize: 30.fS,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 37.dH),
              child: Text(
                'Specifically designed to support the needs of real estate agents by providing an automated solution for generating custom legal clauses, streamlining your workflows.',
                style: GoogleFonts.manrope(
                  fontSize: 18.fS,
                  color: AppColors.color727782,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 27.dH),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175.dW, 54.dH),
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.dW),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ChatScreen.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.dW),
                    child: Text(
                      "Try RealAssit for Free",
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 16.fS,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            ...Strings.subscriptionBenefits.map(
              (text) => _SubscriptionBenefitsLabel(text: text),
            ),
            const Expanded(child: SizedBox()),
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

class _SideMenuOption extends StatelessWidget {
  const _SideMenuOption({required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 34.dH, left: 63.dW),
        child: InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: GoogleFonts.manrope(
                fontSize: 20.fS,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionBenefitsLabel extends StatelessWidget {
  const _SubscriptionBenefitsLabel({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.dH),
      child: Row(
        children: <Widget>[
          Image.asset(
            AppImages.tickSquare,
            height: 24.dW,
            width: 24.dW,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.dW),
            child: Text(
              text,
              style: GoogleFonts.manrope(
                  color: AppColors.color555B67,
                  fontSize: 16.fS,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
