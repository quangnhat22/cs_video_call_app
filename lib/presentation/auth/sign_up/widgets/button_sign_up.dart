part of sign_up;

class ButtonSignUp extends StatelessWidget {
  const ButtonSignUp({
    super.key,
  });

  void _onTapSignUpBtn(BuildContext ctx) {
    ctx.read<SignUpFormCubit>().signUpFormSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      builder: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.inProgress) {
          return const CircularProgressIndicator();
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                buttonText: AppLocalizations.of(context)!.sign_up_text_button,
                onPressed:
                    state.isValid ? () => _onTapSignUpBtn(context) : null,
                backgroundColor: state.isValid
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.grey[400],
              ),
            ),
          );
        }
      },
    );
  }
}
