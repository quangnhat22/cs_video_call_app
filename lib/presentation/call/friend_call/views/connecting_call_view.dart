part of friend_call;

class ConnectingCallView extends StatelessWidget {
  const ConnectingCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
