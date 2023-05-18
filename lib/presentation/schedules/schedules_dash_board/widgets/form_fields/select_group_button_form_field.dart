part of schedule_dash_board;

class SelectGroupButtonFormField extends StatelessWidget {
  const SelectGroupButtonFormField(this.value, this.handleSelect, this.list,
      {super.key});

  final String? value;
  final void Function(String?) handleSelect;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        decoration: InputDecoration(
            hintText:
                AppLocalizations.of(context)!.group_hint_text_text_form_field,
            label:
                Text(AppLocalizations.of(context)!.group_label_text_form_field),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onInverseSurface),
        validator: (value) => value == null
            ? AppLocalizations.of(context)!.group_validation_text
            : null,
        value: value,
        onChanged: handleSelect,
        items: list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
