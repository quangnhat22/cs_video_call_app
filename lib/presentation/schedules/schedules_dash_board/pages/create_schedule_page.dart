part of schedule_dash_board;

class CreateSchedulePage extends StatelessWidget {
  const CreateSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.create_schedule_app_bar_title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            NavigationUtil.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
