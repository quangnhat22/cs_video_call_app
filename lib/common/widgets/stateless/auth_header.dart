import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color mainColor;

  const AuthHeader(this.title, this.subTitle, this.mainColor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
      decoration: BoxDecoration(color: mainColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 251, 255, 1)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
              shape: MaterialStateProperty.all(const CircleBorder())),
          child: Icon(
            Icons.chevron_left,
            color: mainColor,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 12),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            subTitle,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ]),
    );
  }
}
