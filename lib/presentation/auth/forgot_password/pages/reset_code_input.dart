part of forgot_password;

class ResetCodeInput extends StatelessWidget {
  const ResetCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: TextFormField(
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, color: Colors.black),
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
