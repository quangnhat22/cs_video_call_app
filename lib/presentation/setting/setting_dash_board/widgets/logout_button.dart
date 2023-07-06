part of setting_dash_board;

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  void _onTapLogOutButton(BuildContext ctx) {
    AppDefaultDialogWidget()
        .setTitle(AppLocalizations.of(ctx)!.log_out)
        .setAppDialogType(AppDialogType.confirm)
        .setNegativeText(AppLocalizations.of(ctx)!.cancel)
        .setOnPositive(() {
          ctx.read<SettingCubit>().onTapLogOutBtn();
        })
        .setPositiveText(AppLocalizations.of(ctx)!.confirm)
        .buildDialog(ctx)
        .show(ctx);
  }

  @override
  Widget build(BuildContext context) {
    return CustomOutlineIconButton(
      labelText: AppLocalizations.of(context)!.log_out,
      icon: const Icon(Icons.login_outlined),
      color: Theme.of(context).colorScheme.error,
      handleOnClickButton: () => _onTapLogOutButton(context),
    );
  }
}
