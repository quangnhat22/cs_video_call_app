part of group_list;

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  void handleDropdownChange(String selectedValue) {
    debugPrint(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [DropdownGroupsFilterButton(handleDropdownChange)],
            ),
          ),
          const GroupList(),
        ],
      ),
    );
  }
}
