part of email_verify;

class ButttonVerifyReceiveEmail extends StatelessWidget {
  const ButttonVerifyReceiveEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          success: () {
            return CustomElevatedButton(
              AppLocalizations.of(context)!.i_verified,
              () => {},
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
