part of group_call;

class GroupCallPage extends StatelessWidget {
  const GroupCallPage({
    Key? key,
    required this.token,
    required this.groupId,
  }) : super(key: key);

  final String token;
  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CallGroupStatusCubit>()
        ..pageInited(token, groupId)
        ..setUpRoom(),
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
          connectedSuccess: (_, __, ___, ____, room) {
            return GroupCallingPage(
              room: room,
            );
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
