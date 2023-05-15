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
            hintText: 'Please select a group',
            label: const Text('Select a group'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.onInverseSurface),
        validator: (value) => value == null ? "Please select a group" : null,
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
