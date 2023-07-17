part of email_verify;

class ButtonVerifyReceiveEmail extends StatelessWidget {
  const ButtonVerifyReceiveEmail({
    super.key,
  });

  void _onVerifiedEmailBtn(BuildContext ctx) {
    ctx.read<SendEmailCubit>().checkEmailVerify();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsSentEmailCubit, IsSentEmailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.disableVerify
            ? CustomOutlineIconButton(
                labelText:
                    AppLocalizations.of(context)!.continueLabel.toUpperCase(),
                color: Theme.of(context).colorScheme.surface,
                bgColor: Theme.of(context).colorScheme.surfaceVariant,
                handleOnClickButton: null,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                radiusValue: 12,
              )
            : CustomOutlineIconButton(
                labelText:
                    AppLocalizations.of(context)!.continueLabel.toUpperCase(),
                color: Theme.of(context).colorScheme.primary,
                bgColor: Theme.of(context).colorScheme.primaryContainer,
                handleOnClickButton: () => _onVerifiedEmailBtn(context),
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                radiusValue: 12,
              );
      },
    );
  }
}
