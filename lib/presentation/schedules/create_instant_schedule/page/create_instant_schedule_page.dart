import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/app_bar/page_app_bar.dart';

class CreateInstantSchedulePage extends StatelessWidget {
  const CreateInstantSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateInstantScheduleView();
  }
}

class CreateInstantScheduleView extends StatelessWidget {
  const CreateInstantScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.create_schedule_app_bar_title,
        actionWidgets: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(),
    );
  }
}
