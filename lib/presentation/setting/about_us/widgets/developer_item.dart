part of about_us;

class DeveloperItem extends StatelessWidget {
  const DeveloperItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAvatarImage(
          maxRadiusEmptyImg: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
