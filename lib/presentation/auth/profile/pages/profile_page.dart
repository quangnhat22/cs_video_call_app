part of profile;

class SetUpProfilePage extends StatefulWidget {
  const SetUpProfilePage({super.key});

  @override
  State<SetUpProfilePage> createState() => _SetUpProfilePageState();
}

class _SetUpProfilePageState extends State<SetUpProfilePage> {
  // final _formKey = GlobalKey<FormState>();

  // final _fullNameController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _birthdayController = TextEditingController();
  // String _selectedGender = 'male';

  // void updateProfile() {
  //   if (_formKey.currentState!.validate()) {
  //     // log(_fullNameController.text);
  //     // Navigator.push(context,
  //     //     MaterialPageRoute(builder: (context) => const AddAvatarPage()));
  //   }
  // }

  String? validateEmptyField(String? value, String errorText) {
    if (value == null || value.isEmpty) {
      return errorText;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            AuthHeader(
              'Set up profile',
              'Give more information about you',
              Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              left: 0,
              right: 0,
              // top: 0,
              bottom: 0,
              height: MediaQuery.of(context).size.height *
                  (MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1
                      : 0.7),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height *
                    (MediaQuery.of(context).orientation == Orientation.landscape
                        ? 1
                        : 0.7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 1),
                  child: const FormSetUpProfile(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
