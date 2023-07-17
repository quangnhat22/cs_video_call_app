import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/call/personal_call/cubit_personal_call/personal_call_cubit.dart';
import 'package:videocall/presentation/call/personal_call/widgets/personal_call_main_body.dart';

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
        children: const <Widget>[
          PersonalCallMainBody(),
        ],
      ),
    );
  }
}
