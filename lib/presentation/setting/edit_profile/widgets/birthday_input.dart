import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayInput extends StatefulWidget {
  const BirthdayInput({Key? key}) : super(key: key);

  @override
  State<BirthdayInput> createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextField(
        controller: dateInput,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.calendar_today),
          label: Text("Birthday"),
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        readOnly: true, //set it true, so that user will not able to edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              //DateTime.now() - not to allow to choose before today.
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(() {
              dateInput.text =
                  formattedDate; //set output date to TextField value.
            });
          } else {
            log("Date is not selected");
          }
        },
      ),
    );
  }
}
