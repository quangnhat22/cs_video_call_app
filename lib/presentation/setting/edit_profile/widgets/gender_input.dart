import 'package:flutter/material.dart';
import 'package:videocall/presentation/setting/edit_profile/widgets/select_gender_form_dialog.dart';

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
      builder: (context) => GenderFormDialog(
        initGender: genderController.text,
      ),
    ).then((value) {
      setState(() {
        genderController.text = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: genderController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.people_outline),
          suffixIcon: Icon(Icons.expand_more_outlined),
          label: Text("Gender"),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
        readOnly: true,
        onTap: () => _showDialog(context),
      ),
    );
  }
}
