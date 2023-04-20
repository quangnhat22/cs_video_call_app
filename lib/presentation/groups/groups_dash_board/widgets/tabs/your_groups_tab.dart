part of groups_dash_board;

class YourGroupsTab extends StatelessWidget {
  const YourGroupsTab({super.key});

  void handleDropdownChange(String selectedValue) {
    debugPrint(selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [DropdownGroupsFilterButton(handleDropdownChange)],
              ),
            ),
            SizedBox(
                height: constraints.maxHeight * 0.85, child: const GroupList()),
          ],
        ),
      );
    });
  }
}
