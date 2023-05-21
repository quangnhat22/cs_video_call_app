part of profile;

class InputGender extends StatefulWidget {
  const InputGender({
    super.key,
  });

  @override
  State<InputGender> createState() => _InputGenderState();
}

class _InputGenderState extends State<InputGender> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: const [
        DropdownMenuItem(value: 'male', child: Text('Male')),
        DropdownMenuItem(value: 'female', child: Text('Female')),
      ],
      // value: _selectedGender,
      onChanged: (value) {
        // if (value != null) {
        //   setState(() {
        //     _selectedGender = value;
        //   });
        // }
      },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.today),
        label: Text('Gender (*)'),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
