part of email_verify;

class ColumnButtonAction extends StatelessWidget {
  const ColumnButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendEmailCubit, SendEmailState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inProgress: (_) {
            return const CircularProgressIndicator();
          },
          verified: (_) {
            return CustomElevatedButton(
              buttonText: AppLocalizations.of(context)!.edit_profile,
              onPressed: () {
                NavigationUtil.pushReplacementNamed(
                    routeName: RouteName.editProfile);
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
            );
          },
          orElse: () {
            return Column(
              children: const <Widget>[
                ButtonResendEmail(),
                SizedBox(
                  height: 20,
                ),
                ButtonVerifyReceiveEmail(),
              ],
            );
          },
        );
      },
    );
  }
}
