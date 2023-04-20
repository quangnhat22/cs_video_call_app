part of friends_infor;

class FriendDetailsInfor extends StatelessWidget {
  final List<Map<String, dynamic>> friendDetails;

  const FriendDetailsInfor(this.friendDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 90.h),
      child: Card(
        elevation: 4,
        child: Column(
          children: friendDetails
              .mapIndexed((index, element) => Column(
                    children: [
                      ListTile(
                        title: Text(element['title']),
                        subtitle: const Text('Trần Đình Khôi'),
                        leading: element['leading'],
                      ),
                      if (index != friendDetails.length - 1)
                        const Divider(
                          height: 0,
                        )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
