part of welcome;

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
    return BlocConsumer<WelcomeCubit, WelcomeState>(
      listener: (context, state) {
        state.whenOrNull(
          // signInWithGoogleSuccess: () {
          //   context.read<AppBloc>().add(AppUserChanged());
          // },
          signInFail: (message) {
            SnackBarApp.showSnackBar(context, message, TypesSnackBar.error);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          signInWithGoogleInProgress: () => const LoadingPage(),
          orElse: () {
            return Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: SafeArea(
                    child: Column(
                      children: const <Widget>[
                        SizedBox(
                          height: 12,
                        ),
                        WelcomePanel(),
                        SizedBox(
                          height: 24,
                        ),
                        WelcomeActions(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
