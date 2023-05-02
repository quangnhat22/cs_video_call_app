part of setting_dash_board;

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  void _onTapLogOutButton(BuildContext ctx) {
    AppDialog.showConfirmDialog(
      ctx,
      AppLocalizations.of(ctx)!.log_out,
      AppLocalizations.of(ctx)!.are_you_sure_want_to_log_out,
      () {
        Navigator.of(ctx).pop();
      },
      () {
        ctx.read<SettingCubit>().onTapLogOutBtn();
      },
    );
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
