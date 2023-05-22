part of sign_up;

class TextNoticeSentEmail extends StatelessWidget {
  const TextNoticeSentEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormCubit, SignUpFormState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.text_send_email(state.email.value),
            textAlign: TextAlign.center,
            style: AppTextStyles.captionTextStyle.copyWith(
              height: 1.8,
              fontSize: AppScreenUtils.isLandscape() ? 16.sp : 14.sp,
            ),
          ),
        );
      },
    );
  }
}
