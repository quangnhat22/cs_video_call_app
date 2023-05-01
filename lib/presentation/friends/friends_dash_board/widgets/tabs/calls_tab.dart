part of friends_dash_board;

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownFilterButton(handleDropdownChange),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 26)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.red),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    child: Text(AppLocalizations.of(context)!
                        .friends_clear_text_button))
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight *
                (AppScreenUtils.isLandscape() ? 0.7 : 0.85),
            child: const CallList(),
          ),
        ],
      ));
    });
  }
}
