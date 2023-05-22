part of sign_up;

class SignUpMainView extends StatefulWidget {
  const SignUpMainView({
    super.key,
    this.initialPage = 0,
  });

  final int initialPage;

  @override
  State<SignUpMainView> createState() => _SignUpMainViewState();
}

class _SignUpMainViewState extends State<SignUpMainView> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpPageViewCubit, SignUpPageViewState>(
      listener: (context, state) {
        _controller.animateToPage(
          state.pageIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
      child: PageView(
        controller: _controller,
        children: const <Widget>[
          RegisterAccountView(),
          VerifyEmailPage(),
          SetUpProfilePage(),
          AvatarPage(),
        ],
      ),
    );
  }
}
