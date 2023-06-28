import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../cubit/create_schedule_form_cubit.dart';

class InputDescriptionMeeting extends StatefulWidget {
  const InputDescriptionMeeting({super.key});

  @override
  State<InputDescriptionMeeting> createState() =>
      _InputDescriptionMeetingState();
}

class _InputDescriptionMeetingState extends State<InputDescriptionMeeting> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      context
          .read<CreateScheduleFormCubit>()
          .descriptionChanged(_controller.text);
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
    return SizedBox(
      height: 100.h,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          label: Text(
              AppLocalizations.of(context)!.description_label_text_form_field),
          hintText: AppLocalizations.of(context)!
              .description_hint_text_text_form_field,
          alignLabelWithHint: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
      ),
    );
  }
}
