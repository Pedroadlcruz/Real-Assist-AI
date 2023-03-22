// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_assit_ai/core/services/network_info_service.dart';
import 'package:real_assit_ai/features/chat/data/repository/chat_repository.dart';
import 'package:real_assit_ai/features/chat/presentation/chat_screen.dart';

import '../../features/auth/presentation/loggen_in_chat_screen.dart';
import '../../features/chat/blocs/chat_bloc/chat_bloc.dart';
import '../../features/subcription/presentation/subscription_screen.dart';

class AppRouter {
  ///
  /// Given a [route name]...
  ///Build a route base on the current Platform [IOS] and [Android]
  ///
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _buildPage(const LoggenInChatScreen());
      case SubscriptionScreen.routeName:
        return _buildPage(const SubscriptionScreen());
      case ChatScreen.routeName:
        return _buildPage(BlocProvider(
          create: (_) => ChatBloc(
              chatRepository: ChatRepository(networkInfo: NetworkInfoService()))
            ..add(const SendWelcomeMsg()),
          child: const ChatScreen(),
        ));
      default:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

//Build a route base on the current Platform [IOS] and [Android]
  static Route<dynamic> _buildPage(
    Widget page, {
    String? routeName,
    Object? arguments,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (_) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    } else {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        settings: RouteSettings(name: routeName, arguments: arguments),
      );
    }
  }
}
