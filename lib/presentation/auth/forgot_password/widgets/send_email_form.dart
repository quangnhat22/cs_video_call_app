part of forgot_password;

class SendEmailForm extends StatefulWidget {
  const SendEmailForm({super.key});

  @override
  State<SendEmailForm> createState() => _SendEmailFormState();
}

class _SendEmailFormState extends State<SendEmailForm> {
  final TextEditingController _controller = TextEditingController();

  Future<void> handleSendEmail(BuildContext context) async {
    context.read<ForgotPasswordCubit>().submitEmail();
  }

  @override
  void initState() {
    _controller.addListener(() {
      context.read<ForgotPasswordCubit>().emailChanged(_controller.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.statusSubmit == FormzSubmissionStatus.success) {
          _controller.text = '';
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Form(
                child: Column(
              children: <Widget>[
                CTextFormField(
                  controller: _controller,
                  key: const Key('sendEmailForm_emailInput_textField'),
                  icon: const Icon(Icons.email_outlined),
                  label: AppLocalizations.of(context)!.email_text_field_label,
                  onChange: (email) {},
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
                    child: state.isSentEmail
                        ? CountdownButton(onPressed: () {
                            handleSendEmail(context);
                          })
                        : CustomElevatedButton(
                            buttonText:
                                AppLocalizations.of(context)!.send_email,
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
      ),
    );
  }
}
