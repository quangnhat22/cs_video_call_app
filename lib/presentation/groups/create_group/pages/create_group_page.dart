part of create_group;

class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({super.key});

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final List<String> allFriends = [
    'Trần Đình Khôi',
    'Trần Đình Lộc',
    'Nguyễn Đình Nhật Quang',
    'Võ Minh Nhật',
    'Hoàng Thu Thủy',
    'Lý Nhân Nghĩa',
    'Đỗ Trí Nhân',
  ];

  final List<String> selectedFriends = [];
  late List<String> friendResults;

  @override
  void initState() {
    super.initState();
    friendResults = [...allFriends];
  }

  void handleSelectMembers(String member) {
    if (!selectedFriends.contains(member)) {
      setState(() {
        selectedFriends.add(member);
      });
    } else {
      setState(() {
        selectedFriends.remove(member);
      });
    }
  }

  void handleTextChange(String value) {
    if (value == '') {
      setState(() {
        friendResults = [...allFriends];
      });
    } else {
      setState(() {
        friendResults = allFriends
            .where(
                (friend) => friend.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateGroupCubit>(
      create: (_) => getIt<CreateGroupCubit>(),
      child: BlocListener<CreateGroupCubit, CreateGroupState>(
        listener: (context, state) {
          if (state is SentCreateRequestGroupFailure) {
            SnackBarApp.showSnackBar(
                context, state.message, TypesSnackBar.error);
          }

          if (state is SentCreateRequestGroupSuccess) {
            SnackBarApp.showSnackBar(
                context,
                AppLocalizations.of(context)!.create_group_successfully,
                TypesSnackBar.success);

            NavigationUtil.pop();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title:
                Text(AppLocalizations.of(context)!.create_group_app_bar_title),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: IconButton(
              onPressed: () {
                NavigationUtil.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              BlocBuilder<CreateGroupCubit, CreateGroupState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      context.read<CreateGroupCubit>().sendCreateGroupRequest();
                    },
                    icon: const Icon(Icons.done),
                  );
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const GroupSetPhoto(),
                  const GroupTextFieldName(),
                  GroupAddMembers(handleSelectMembers, handleTextChange),
                ]),
          ),
        ),
      ),
    );
  }
}
