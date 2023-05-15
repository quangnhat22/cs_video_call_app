part of schedule_dash_board;

class DescriptionTextFormField extends StatelessWidget {
  const DescriptionTextFormField(this.descController, {super.key});

  final TextEditingController descController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Expanded(
        child: TextField(
          controller: descController,
          decoration: const InputDecoration(
            label: Text('Description'),
            hintText: 'Let participants know more about the meeting',
            alignLabelWithHint: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
            ),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          expands: true,
          textAlignVertical: TextAlignVertical.top,
        ),
      ),
    );
  }
}
