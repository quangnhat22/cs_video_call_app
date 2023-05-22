part of sign_up;

class ButttonVerifyReceiveEmail extends StatelessWidget {
  const ButttonVerifyReceiveEmail({
    super.key,
  });

  void _handleOnVerifiedBtn(BuildContext ctx) {
    ctx.read<SignUpPageViewCubit>().pageIndexChanged(2);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          success: () {
            return CustomElevatedButton(
              AppLocalizations.of(context)!.i_verified,
              () => _handleOnVerifiedBtn(context),
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
