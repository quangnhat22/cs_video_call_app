import 'package:flutter/material.dart';

import 'input_description_meeting.dart';
import 'input_name_meeting.dart';

class CreateMeetingForm extends StatelessWidget {
  const CreateMeetingForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              InputNameMeeting(),
              SizedBox(
                height: 24,
              ),
              InputDescriptionMeeting(),
            ],
          ),
        ),
      ),
    );
  }
}
