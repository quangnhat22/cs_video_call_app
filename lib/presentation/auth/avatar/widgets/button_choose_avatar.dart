part of avatar;

class ButtonChooseAvatar extends StatelessWidget {
  const ButtonChooseAvatar({Key? key}) : super(key: key);

  void _handleOnChangePhotoBtn(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          return const DialogPickAvatar();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: CustomElevatedButton(
          'Choose a photo',
          () => _handleOnChangePhotoBtn(context),
          Theme.of(context).colorScheme.secondary),
    );
  }
}
