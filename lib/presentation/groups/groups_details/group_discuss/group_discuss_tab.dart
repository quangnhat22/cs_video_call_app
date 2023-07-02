import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class GroupDiscussTab extends StatefulWidget {
  const GroupDiscussTab({super.key});

  @override
  State<GroupDiscussTab> createState() => _GroupDiscussTabState();
}

class _GroupDiscussTabState extends State<GroupDiscussTab> {
  final textController = TextEditingController();

  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Nguyễn Văn An',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
    {
      'name': 'Nguyễn Văn Bình',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
    {
      'name': 'Nguyễn Tự Cường',
      'chatText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing adipiscing elit',
    },
  ];

  Widget showFullScreenKeyboard(
      BuildContext context, TextEditingController txtCtrl) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(child: Container()),
        Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                maxLines: 5,
                autofocus: true,
                controller: txtCtrl,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Done')),
            const SizedBox(width: 200),
          ],
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 60.h),
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  chatList[index]['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(chatList[index]['chatText']),
                leading: const CircleAvatar(
                  child: Text('A'),
                ),
                // isThreeLine: true,
                trailing: Text(DateFormat.Hm().format(DateTime.now())),
              );
            },
            itemCount: chatList.length,
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60.h,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 26,
                      )),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        size: 26,
                      ))
                ],
              ),
            )),
      ],
    );
  }
}
