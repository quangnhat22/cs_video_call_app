part of edit_theme;

class EditThemeView extends StatelessWidget {
  const EditThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<EditThemeCubit>(),
      child: const EditThemeDialog(),
    );
  }
}

class EditThemeDialog extends StatelessWidget {
  const EditThemeDialog({super.key});

  void _handleChangeThemeValue(BuildContext ctx, String value) {
    ctx.read<EditThemeCubit>().appThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditThemeCubit, EditThemeState>(
      builder: (context, state) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.select_theme),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CRadioListTitle(
                value: AppThemeEnum.light.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
              CRadioListTitle(
                value: AppThemeEnum.dark.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
              CRadioListTitle(
                value: AppThemeEnum.system.value,
                groupValue: state.theme,
                onChanged: (value) => _handleChangeThemeValue(context, value),
              ),
            ],
          ),
        );
      },
    );
  }
}
