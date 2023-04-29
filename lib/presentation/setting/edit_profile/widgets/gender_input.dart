import 'package:flutter/material.dart';

class GenderInput extends StatefulWidget {
  const GenderInput({Key? key}) : super(key: key);

  @override
  State<GenderInput> createState() => _GenderInputState();
}

class _GenderInputState extends State<GenderInput> {
  TextEditingController genderController = TextEditingController();

  @override
  void initState() {
    genderController.text = ""; //set the initial value of text field
    super.initState();
  }

  Future<void> _showDialog(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: const Text('Your name'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[TextField()],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: genderController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          label: Text("Enter Date"),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () => _showDialog(context),
      ),
    );
  }
}
