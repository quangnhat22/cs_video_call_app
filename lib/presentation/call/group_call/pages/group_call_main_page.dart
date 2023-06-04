import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videocall/core/di/injector.dart';
import 'package:videocall/presentation/call/group_call/cubit_call_group_status/call_group_status_cubit.dart';
import 'package:videocall/presentation/call/group_call/pages/group_call_waiting_page.dart';
import 'package:videocall/presentation/call/group_call/pages/group_calling.dart';

class GroupCallPage extends StatelessWidget {
  const GroupCallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CallGroupStatusCubit>()..setUpRoom(),
      child: const GroupCallView(),
    );
  }
}

class GroupCallView extends StatelessWidget {
  const GroupCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallGroupStatusCubit, CallGroupStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          preparing: (room) {
            return GroupCallPreparingPage(room: room);
          },
          connectedSuccess: (room) {
            return GroupCalling(room: room);
          },
          orElse: () {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
