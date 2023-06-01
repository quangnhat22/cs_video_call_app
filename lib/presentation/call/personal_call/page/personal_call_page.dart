import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_call_actions.dart';

import '../../../../core/config/app_assets.dart';

class PersonalCallPage extends StatelessWidget {
  const PersonalCallPage({
    Key? key,
    this.receivedAction,
    this.friendId,
  }) : super(key: key);

  final ReceivedAction? receivedAction;
  final String? friendId;

  @override
  Widget build(BuildContext context) {
    return const PersonalCallView();
  }
}

class PersonalCallView extends StatelessWidget {
  const PersonalCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AppAssets.emptyAvatar,
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          const PersonalCallActions(),
        ],
      ),
    );
  }
}
