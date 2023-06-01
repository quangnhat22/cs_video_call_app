import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_call_main_body.dart';

import '../../../../core/config/app_assets.dart';

@Injectable()
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<PersonalCallCubit>()
            ..pageStarted(
              friendId,
              receivedAction,
            ),
        ),
      ],
      child: const PersonalCallView(),
    );
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
          const PersonalCallMainBody(),
        ],
      ),
    );
  }
}
