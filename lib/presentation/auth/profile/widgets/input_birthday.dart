part of profile;

class InputBirthday extends StatefulWidget {
  const InputBirthday({
    super.key,
  });

  @override
  State<InputBirthday> createState() => _InputBirthdayState();
}

class _InputBirthdayState extends State<InputBirthday> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      //validator: (value) => validateEmptyField(value, 'Please choose birthday'),
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.today),
        label: Text('Birthday (*)'),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      onTap: () async {
        DateTime? chosenDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1970),
            lastDate: DateTime.now());

        if (chosenDate != null) {
          setState(() {
            _controller.text = AppDateTimeFormat.formatDDMMYYYY(chosenDate);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
