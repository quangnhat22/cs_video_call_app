import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetCodeInput extends StatelessWidget {
  const ResetCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 220, 219, 219),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8),
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
