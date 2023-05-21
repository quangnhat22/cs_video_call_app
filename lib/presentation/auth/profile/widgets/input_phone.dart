part of profile;

class InputPhone extends StatelessWidget {
  const InputPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: _phoneController,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter phone number';
      //   }

      //   if (!value.isValidPhoneNumber()) {
      //     return 'Phone number is invalid';
      //   }

      //   return null;
      // },
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.phone),
        label: Text('Phone (*)'),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 1),
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
