part of profile;

class FormSetUpProfile extends StatelessWidget {
  const FormSetUpProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: const <Widget>[
            InputFullname(),
            SizedBox(
              height: 4,
            ),
            InputPhone(),
            SizedBox(
              height: 12,
            ),
            InputBirthday(),
            SizedBox(
              height: 12,
            ),
            InputGender(),
            SizedBox(
              height: 100,
            ),
            ButtonSetUpProfile(),
          ],
        ),
      ),
    );
  }
}
