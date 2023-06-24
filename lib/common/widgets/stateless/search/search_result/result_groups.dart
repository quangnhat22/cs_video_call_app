import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:videocall/common/widgets/stateless/custom_avatar_image.dart';

class ResultGroups extends StatelessWidget {
  const ResultGroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            AppLocalizations.of(context)!.groups,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ListTile(
            title: const Text(
              '123',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.group_on_going,
              style: const TextStyle(color: Colors.green),
            ),
            leading: const CustomAvatarImage(
              urlImage: 'https://i.pravatar.cc/',
              widthImage: 50,
              heightImage: 50,
            ),
          ),
          itemCount: 30,
        )
      ],
    );
  }
}
