part of welcome;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AppBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<WelcomeCubit>(),
        ),
      ],
      child: const WelcomeView(),
    );
  }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeCubit, WelcomeState>(
      listener: (context, state) {
        if (state is WelcomeSignInWithGoogleSuccess) {
          context.read<AppBloc>().add(AppUserChanged());
        }
        if (state is WelcomeSignInWithGoogleFailure) {
          SnackBarApp.showSnackBar(context, state.message, TypesSnackBar.error);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: const <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    WelcomePanel(),
                    SizedBox(
                      height: 26,
                    ),
                    WelcomeActions(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
