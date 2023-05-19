part of schedule_dash_board;

class TimePickerTextFormField extends StatelessWidget {
  const TimePickerTextFormField(
      this.dateController, this.handleTap, this.label, this.period,
      {super.key});

  final TextEditingController dateController;
  final Function handleTap;
  final String label;
  final PeriodEnum period;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: dateController,
      readOnly: true,
      onTap: () => handleTap(period),
      decoration: InputDecoration(
        suffixIcon: label.contains('time')
            ? const Icon(Icons.schedule)
            : const Icon(Icons.today),
        label: Text(label),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
