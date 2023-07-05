part of about_us;

class DeveloperList extends StatelessWidget {
  const DeveloperList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        DeveloperItem(title: 'Tran Dinh Khoi - Team FE'),
        DeveloperItem(title: 'Nguyen Dinh Nhat Quang - Team FE'),
        DeveloperItem(title: 'Tran Dinh Loc - Team BE'),
      ],
    );
  }
}
