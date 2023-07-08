part of create_group;

class GroupAddMembers extends StatefulWidget {
  const GroupAddMembers({super.key});

  @override
  State<GroupAddMembers> createState() => _GroupAddMembersState();
}

class _GroupAddMembersState extends State<GroupAddMembers> {
  final List<UserEntity?> selectedFriends = [];

  void handleSelectMembers(BuildContext ctx, UserEntity member) {
    ctx.read<CreateGroupCubit>().groupMembersChanged(member);

    final existingMember = selectedFriends.firstWhere(
      (element) => element?.id == member.id,
      orElse: () => null,
    );
    setState(() {
      if (existingMember == null) {
        selectedFriends.add(member);
      } else {
        selectedFriends.removeWhere((element) => element?.id == member.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<FriendsContactBloc>()..add(const FriendsContactEvent.started()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context)!.add_members,
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onInverseSurface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  hintText: AppLocalizations.of(context)!.search_friends),
              // onChanged: (value) {
              //   widget.onTextChange(value);
              // },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              '${selectedFriends.length} ${AppLocalizations.of(context)!.selected_text}',
              textAlign: TextAlign.start,
              style: AppTextStyles.mediumTitleTextStyle,
            ),
          ),
          BlocBuilder<FriendsContactBloc, FriendsContactState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return state.maybeWhen(
                success: (friends) {
                  return friends.isEmpty
                      ? Center(
                          child: Text(
                              AppLocalizations.of(context)!.no_friends_found),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CheckboxListTile(
                              title: Text(friends[index].name!.isEmpty
                                  ? AppLocalizations.of(context)!.unknown_name
                                  : friends[index].name!),
                              // subtitle: Text(
                              //   AppLocalizations.of(context)!
                              //       .user_status_online,
                              //   style: const TextStyle(color: Colors.green),
                              // ),
                              secondary: CustomAvatarImage(
                                urlImage: friends[index].avatar,
                                widthImage: 46,
                                heightImage: 46,
                              ),
                              value: selectedFriends.firstWhere(
                                    (element) =>
                                        element?.id == friends[index].id,
                                    orElse: () => null,
                                  ) !=
                                  null,
                              onChanged: (bool? value) => {
                                handleSelectMembers(context, friends[index])
                              },
                            );
                          },
                          itemCount: friends.length,
                        );
                },
                failure: (message) {
                  return Center(
                    child: Text(message),
                  );
                },
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
