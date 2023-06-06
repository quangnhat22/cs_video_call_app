part of create_group;

class ButtonAddNewGroup extends StatelessWidget {
  const ButtonAddNewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          sendCreateRequestInProgress: () {
            return const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            );
          },
          orElse: () {
            return IconButton(
              onPressed: () {
                context.read<CreateGroupCubit>().sendCreateGroupRequest();
              },
              icon: const Icon(Icons.done),
            );
          },
        );
      },
    );
  }
}
