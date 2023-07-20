part of group_call;

class GroupCallingPage extends StatefulWidget {
  const GroupCallingPage({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  State<GroupCallingPage> createState() => _GroupCallingPageState();
}

class _GroupCallingPageState extends State<GroupCallingPage> {
  PageController controller = PageController(
    viewportFraction: 1,
    keepPage: true,
    initialPage: 0,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PageView(
        children: [
          BlocProvider(
            create: (_) => getIt<GroupCallPinMessageBloc>(),
            child: PageView(
              controller: controller,
              children: [
                GroupCalling(
                  room: widget.room,
                  pageController: controller,
                ),
                ListMessageView(
                  pageController: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
