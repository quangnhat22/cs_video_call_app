part of schedule_dash_board;

class DescriptionTextFormField extends StatelessWidget {
  const DescriptionTextFormField(this.descController, {super.key});

  final TextEditingController descController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Expanded(
        child: TextFormField(
          controller: descController,
          decoration: InputDecoration(
            label: Text(AppLocalizations.of(context)!
                .description_label_text_form_field),
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
      ),
    );
  }
}
