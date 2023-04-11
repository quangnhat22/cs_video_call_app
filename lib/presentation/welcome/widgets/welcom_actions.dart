part of welcome;

class WelcomeActions extends StatelessWidget {
  const WelcomeActions({Key? key}) : super(key: key);

  double? _getWithByOrientation() {
    return AppScreenUtils.isLandscape() ? 0.6.sw : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomOutlineIconButton(
          labelText: AppLocalizations.of(context)!.sign_in_with_email,
          icon: const Icon(Icons.mail),
          widthBtn: _getWithByOrientation(),
          handleOnClickButton: () {},
        ),
        CustomOutlineIconButton(
          labelText: AppLocalizations.of(context)!.sign_in_with_google,
          icon: AppAssets.logoGoogle,
          widthBtn: _getWithByOrientation(),
          handleOnClickButton: () {},
        ),
        DividerWithText(text: AppLocalizations.of(context)!.or),
        SignInButton(
          width: _getWithByOrientation(),
        ),
      ],
    );
  }
}
