part of group_edit;

class EditGroupPage extends StatelessWidget {
  const EditGroupPage(
      {required this.groupId,
      required this.groupName,
      this.groupImage,
      super.key});

  final String groupId;
  final String groupName;
  final String? groupImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditGroupCubit>()..initValue(groupName, groupImage),
      child: EditGroupView(
        groupId: groupId,
      ),
    );
  }
}

class EditGroupView extends StatelessWidget {
  const EditGroupView({required this.groupId, super.key});

  final String groupId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditGroupCubit, EditGroupState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SentEditRequestGroupFailure) {
          SnackBarApp.showSnackBar(
            context,
            state.message,
            TypesSnackBar.error,
          );
          NavigationUtil.pop();
        }

        if (state is SentEditRequestGroupSuccess) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.edit_group_successfully,
              TypesSnackBar.success);
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.edit_group_app_bar_title),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              NavigationUtil.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            EditGroupButton(groupId: groupId),
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<EditGroupCubit, EditGroupState>(
            builder: (context, state) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BlocBuilder<EditGroupCubit, EditGroupState>(
                      builder: (context, state) {
                        String? groupImage;
                        if (state is SentEditRequestGroupInitValue &&
                            state.groupImage.isNotEmpty) {
                          groupImage = state.groupImage;
                        }

                        return GroupChangePhoto(
                          mode: AppGroupFormMode.edit,
                          groupImage: groupImage,
                        );
                      },
                    ),
                    BlocBuilder<EditGroupCubit, EditGroupState>(
                      builder: (context, state) {
                        String groupName = '';
                        if (state is SentEditRequestGroupInitValue) {
                          groupName = state.groupName;
                        }
                        return GroupInputName(
                          initialValue: groupName,
                          handleGroupNameChange: (value) => context
                              .read<EditGroupCubit>()
                              .groupNameChanged(value),
                        );
                      },
                    ),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
