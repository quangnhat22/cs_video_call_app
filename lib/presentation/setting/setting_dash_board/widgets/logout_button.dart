part of setting_dash_board;

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlineIconButton(
      labelText: AppLocalizations.of(context)!.log_out,
      icon: const Icon(Icons.login_outlined),
      color: Theme.of(context).colorScheme.error,
      handleOnClickButton: () {},
    );
  }
}
