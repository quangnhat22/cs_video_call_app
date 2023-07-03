part of email_verify;

class ButttonVerifyReceiveEmail extends StatelessWidget {
  const ButttonVerifyReceiveEmail({
    super.key,
  });

  void _onVerifiedEmailBtn(BuildContext ctx) {
    ctx.read<SendEmailCubit>().checkEmailVerify();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inProgress: (_) {
            return const LinearProgressIndicator();
          },
          orElse: () {
            return CustomElevatedButton(
              buttonText: AppLocalizations.of(context)!.i_verified,
              onPressed: () => _onVerifiedEmailBtn(context),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            );
          },
        );
      },
    );
  }
}
