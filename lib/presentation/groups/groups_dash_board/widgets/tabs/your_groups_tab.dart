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
              height: constraints.maxHeight *
                  (AppScreenUtils.isLandscape() ? 0.3 : 0.15),
              padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: AppScreenUtils.isLandscape() ? 20 : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [DropdownGroupsFilterButton(handleDropdownChange)],
              ),
            ),
            SizedBox(
                height: constraints.maxHeight *
                    (AppScreenUtils.isLandscape() ? 0.7 : 0.85),
                child: const GroupList()),
          ],
        ),
      );
    });
  }
}
