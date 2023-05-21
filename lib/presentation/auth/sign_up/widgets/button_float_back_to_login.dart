part of sign_up;

class ButtonFloatBackToLogin extends StatelessWidget {
  const ButtonFloatBackToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              //return login
              Navigator.pop(context);
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary,
                ),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                )),
            child: const Icon(Icons.chevron_left),
          ),
        ),
      ],
    );
  }
}
