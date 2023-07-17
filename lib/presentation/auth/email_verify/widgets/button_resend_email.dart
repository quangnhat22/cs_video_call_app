part of email_verify;

class ButtonResendEmail extends StatelessWidget {
  const ButtonResendEmail({
    super.key,
  });

  void _handleOnSentEmail(BuildContext ctx) async {
    ctx.read<SendEmailCubit>().sendEmail();
    ctx.read<IsSentEmailCubit>().changeStatusIsSentEmail(value: true);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      buildWhen: (prev, current) => prev != current,
      builder: (context, state) {
        return state.maybeMap(
          verified: (_) {
            return Container();
          },
          orElse: () {
            return BlocBuilder<IsSentEmailCubit, IsSentEmailState>(
              buildWhen: (prev, current) => prev != current,
              builder: (context, stateIsSentEmail) {
                return stateIsSentEmail.isSentEmail
                    ? CountdownButton(
                        onPressed: () => _handleOnSentEmail(context))
                    : CustomOutlinedButton(
                        buttonText: AppLocalizations.of(context)!.send_email,
                        onPressed: () => _handleOnSentEmail(context),
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      );
              },
            );
          },
        );
      },
    );
  }
}
