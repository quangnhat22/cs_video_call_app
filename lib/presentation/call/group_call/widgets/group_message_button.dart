part of group_call;

class GroupMessageButton extends StatelessWidget {
  const GroupMessageButton({super.key, this.onPress});

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallGroupStatusCubit, CallGroupStatusState>(
      builder: (context, state) {
        return state.maybeWhen(
          connectedSuccess: (_, __, isHasNewMessage, ___, ____) {
            return Stack(
              children: <Widget>[
                IconWrapper(
                  iconButton: IconButton(
                    onPressed: onPress,
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                    ),
                    tooltip: 'message',
                  ),
                ),
                if (isHasNewMessage)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.error,
                          border: const Border.fromBorderSide(
                            BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
          orElse: () {
            return IconWrapper(
              iconButton: IconButton(
                onPressed: onPress,
                icon: const Icon(
                  Icons.message_outlined,
                  color: Colors.black,
                ),
                tooltip: 'message',
              ),
            );
          },
        );
      },
    );
  }
}
