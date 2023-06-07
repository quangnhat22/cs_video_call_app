part of edit_profile;

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: const <Widget>[
            FullNameInput(),
            PhoneNumberInput(),
            BirthdayInput(),
            GenderInput(),
            BioInput(),
            ConfirmButton(),
          ],
        ),
      ),
    );
  }
}
