part of friends_call;

const List<AppCallStatus> listItem = <AppCallStatus>[
  AppCallStatus.ended,
  AppCallStatus.missed,
  AppCallStatus.onGoing,
  AppCallStatus.reject
];

class DropdownFilterButton extends StatefulWidget {
  final Function onChange;

  const DropdownFilterButton(this.onChange, {super.key});

  @override
  State<DropdownFilterButton> createState() => _DropdownFilterButtonState();
}

class _DropdownFilterButtonState extends State<DropdownFilterButton> {
  AppCallStatus dropdownValue = AppCallStatus.onGoing;

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
        child: DropdownButton<AppCallStatus>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 8,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: BorderRadius.circular(8),
          onChanged: (AppCallStatus? value) {
            setState(() {
              dropdownValue = value!;
            });

            widget.onChange(context, value);
          },
          items: listItem
              .map<DropdownMenuItem<AppCallStatus>>((AppCallStatus status) {
            return DropdownMenuItem<AppCallStatus>(
              value: status,
              child: Text(status.value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
