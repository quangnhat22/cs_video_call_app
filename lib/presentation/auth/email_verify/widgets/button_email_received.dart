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
          success: (_) {
            return CustomElevatedButton(
              AppLocalizations.of(context)!.i_verified,
              () => _onVerifiedEmailBtn(context),
              Theme.of(context).colorScheme.secondary,
            );
          },
          orElse: () {
            return const LinearProgressIndicator();
          },
        );
      },
    );
  }
}