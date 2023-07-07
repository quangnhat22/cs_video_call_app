import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubit/create_schedule_form_cubit.dart';

class InputNameMeeting extends StatefulWidget {
  const InputNameMeeting({super.key});

  @override
  State<InputNameMeeting> createState() => _InputNameMeetingState();
}

class _InputNameMeetingState extends State<InputNameMeeting> {
  final TextEditingController _controller = TextEditingController();

  String? validateTitle(String? value, BuildContext buildContext) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(buildContext)!.title_validation_text;
    }

    return null;
  }

  @override
  void initState() {
    _controller.addListener(() {
      context.read<CreateScheduleFormCubit>().titleChanged(_controller.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: (title) {
        if (title.trim() == '') {
          context.read<CreateScheduleFormCubit>().titleChanged(title);
        }
      },
      validator: (value) => validateTitle(value, context),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.title_hint_text_text_form_field,
        label: Text(
            '${AppLocalizations.of(context)!.title_label_text_form_field} (*)'),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
