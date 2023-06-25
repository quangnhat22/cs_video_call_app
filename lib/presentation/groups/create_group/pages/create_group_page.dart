part of create_group;

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateGroupCubit>(),
      child: const CreateGroupView(),
    );
  }
}

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateGroupCubit, CreateGroupState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SentCreateRequestGroupFailure) {
          SnackBarApp.showSnackBar(
            context,
            state.message,
            TypesSnackBar.error,
          );
          NavigationUtil.pop();
        }

        if (state is SentCreateRequestGroupSuccess) {
          SnackBarApp.showSnackBar(
              context,
              AppLocalizations.of(context)!.create_group_successfully,
              TypesSnackBar.success);
          NavigationUtil.pop(result: true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.create_group_app_bar_title),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            onPressed: () {
              NavigationUtil.pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          actions: const [
            ButtonAddNewGroup(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                GroupSetPhoto(),
                GroupTextFieldName(),
                GroupAddMembers(),
              ]),
        ),
      ),
    );
  }
}
