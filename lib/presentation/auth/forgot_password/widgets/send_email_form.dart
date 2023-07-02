part of forgot_password;

class SendEmailForm extends StatelessWidget {
  const SendEmailForm({super.key});

  Future<void> handleSendEmail(BuildContext context) async {
    // TODO: Add the line below to call send email api
    // await context.read<SendEmailCubit>().submitEmail();
    Navigator.pushReplacementNamed(context, RouteName.confirmResetPasswordCode);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: BlocBuilder<SendEmailCubit, SendEmailState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Form(
              child: Column(
            children: <Widget>[
              CTextFormField(
                key: const Key('sendEmailForm_emailInput_textField'),
                icon: const Icon(Icons.email_outlined),
                label: AppLocalizations.of(context)!.email_text_field_label,
                onChange: (email) {
                  context.read<SendEmailCubit>().emailChanged(email);
                },
                errorText: state.email.displayError != null
                    ? state.email.error?.message
                    : null,
              ),
              if (state.statusSubmit == FormzSubmissionStatus.inProgress)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: CircularProgressIndicator(),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: CustomElevatedButton(
                    buttonText: AppLocalizations.of(context)!.send_email,
                    onPressed: state.isValid
                        ? () {
                            handleSendEmail(context);
                          }
                        : null,
                    backgroundColor: state.isValid
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400],
                  ),
                )
            ],
          ));
        },
      ),
    );
  }
}
