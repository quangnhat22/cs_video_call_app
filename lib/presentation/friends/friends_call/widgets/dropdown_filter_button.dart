part of friends_call;

const List<AppCallStatus> listItem = <AppCallStatus>[
  AppCallStatus.ended,
  AppCallStatus.missed,
  AppCallStatus.onGoing,
  AppCallStatus.reject
];

class DropdownFilterButton extends StatelessWidget {
  const DropdownFilterButton({super.key});

  void handleDropdownChange(BuildContext ctx, AppCallStatus status) {
    ctx
        .read<HistoryCallBloc>()
        .add(HistoryCallEvent.filterStatusCall(status: status));
  }

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
            dropdownValue = value!;
            handleDropdownChange(context, value);
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

AppCallStatus dropdownValue = AppCallStatus.onGoing;
