part of schedule_dash_board;

class TitleTextFormField extends StatelessWidget {
  const TitleTextFormField(this.titleController, {super.key});

  final TextEditingController titleController;

  String? validateTitle(String? value, BuildContext buildContext) {
    if (value == null || value.isEmpty) {
      return 'Please enter meeting title';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: titleController,
      validator: (value) => validateTitle(value, context),
      decoration: const InputDecoration(
        hintText: 'Enter meeting title',
        label: Text('Meeting title'),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
      ),
    );
  }
}
