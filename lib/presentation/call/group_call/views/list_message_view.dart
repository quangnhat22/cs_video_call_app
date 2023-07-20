part of group_call;

class ListMessageView extends StatefulWidget {
  const ListMessageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<ListMessageView> createState() => _ListMessageViewState();
}

class _ListMessageViewState extends State<ListMessageView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCallPinMessageBloc, GroupCallPinMessageState>(
      listener: (context, state) {
        if (state is GroupCallPinMessageSuccess) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.pin_message_success,
              TypesSnackBar.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => AppScreenUtils.hideInputKeyboard(),
              child: Stack(children: [
                BlocBuilder<CallGroupStatusCubit, CallGroupStatusState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      connectedSuccess:
                          (user, listMessage, _, pinMessage, room) {
                        if (listMessage == null || listMessage.isEmpty) {
                          return Center(
                            child: Text(AppLocalizations.of(context)!
                                .no_messages_found),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.only(
                            left: 8,
                            right: 8,
                            top: 48.h,
                            bottom: 60.h,
                          ),
                          child: ListView.separated(
                            reverse: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 20,
                            ),
                            itemBuilder: (context, index) {
                              return GroupCallMessageItem(
                                messageCallEntity: listMessage[index],
                                isPinned: pinMessage != null
                                    ? pinMessage.contains(listMessage[index].id)
                                    : false,
                                messageChild: ListTile(
                                  title: Text(
                                    listMessage[index].name ??
                                        AppLocalizations.of(context)!
                                            .unknown_name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                      Text(listMessage[index].message ?? ''),
                                  leading: CustomAvatarImage(
                                    urlImage: listMessage[index].avatar,
                                    size: CustomAvatarSize.small,
                                  ),
                                  // isThreeLine: true,
                                  trailing: Text(
                                      DateFormat.Hm().format(DateTime.now())),
                                ),
                              );
                            },
                            itemCount: listMessage.length,
                          ),
                        );
                      },
                      orElse: () => const ListSkeleton(),
                    );
                  },
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.6),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              minLines: 1,
                              maxLines: null,
                              decoration: InputDecoration(
                                filled: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 4,
                                ),
                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 0.0,
                                    style: BorderStyle.none,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CallGroupStatusCubit>()
                                  .sendMessageData(_controller.text);
                              _controller.text = '';
                            },
                            icon: const Icon(
                              Icons.send_outlined,
                              size: 26,
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                        //   backgroundColor: MaterialStateProperty.all(backgroundColor),
                        shape: MaterialStateProperty.all(const CircleBorder())),
                    child: const Icon(
                      Icons.chevron_left,
                      //color: iconColor,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
