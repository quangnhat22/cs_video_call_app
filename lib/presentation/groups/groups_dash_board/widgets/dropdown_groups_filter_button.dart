part of groups_dash_board;

const List<String> listItem = <String>['All', 'Incoming', 'Missed'];

class DropdownGroupsFilterButton extends StatefulWidget {
  final Function onChange;

  const DropdownGroupsFilterButton(this.onChange, {super.key});

  @override
  State<DropdownGroupsFilterButton> createState() =>
      _DropdownGroupsFilterButtonState();
}

class _DropdownGroupsFilterButtonState
    extends State<DropdownGroupsFilterButton> {
  String dropdownValue = listItem.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 8,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(8),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });

            widget.onChange(value);
          },
          items: listItem.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
