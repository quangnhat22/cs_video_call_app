part of sign_up;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SignUpFormCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<SignUpPageViewCubit>(),
        ),
      ],
      child: const SignUpContainer(),
    );
  }
}

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPageViewCubit, SignUpPageViewState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        return SignUpMainView(
          initialPage: state.pageIndex,
        );
      },
    );
  }
}
