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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: titleController,
        validator: (value) => validateTitle(value, context),
        decoration: const InputDecoration(
          label: Text('Meeting title'),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}
