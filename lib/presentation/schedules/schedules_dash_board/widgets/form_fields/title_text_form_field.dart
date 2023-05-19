part of schedule_dash_board;

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField(this.titleController, {super.key});

  final TextEditingController titleController;

  String? validateTitle(String? value, BuildContext buildContext) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(buildContext)!.title_validation_text;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (value) => validateTitle(value, context),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.title_hint_text_text_form_field,
        label: Text(AppLocalizations.of(context)!.title_label_text_form_field),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
