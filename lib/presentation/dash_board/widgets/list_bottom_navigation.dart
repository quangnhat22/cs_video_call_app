part of dash_board;

class ListBottomNavigation extends StatelessWidget {
  const ListBottomNavigation({
    Key? key,
    required this.handleOnTab,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) handleOnTab;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.emoji_people_outlined),
          selectedIcon: const Icon(Icons.emoji_people),
          label: AppLocalizations.of(context)!.friends,
        ),
        NavigationDestination(
          icon: const Icon(Icons.groups_outlined),
          selectedIcon: const Icon(Icons.groups),
          label: AppLocalizations.of(context)!.groups,
        ),
        NavigationDestination(
          icon: const Icon(Icons.notifications_outlined),
          selectedIcon: const Icon(Icons.notifications),
          label: AppLocalizations.of(context)!.notifications,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.setting,
        ),
      ],
      onDestinationSelected: handleOnTab,
      selectedIndex: currentIndex,
    );
  }
}
