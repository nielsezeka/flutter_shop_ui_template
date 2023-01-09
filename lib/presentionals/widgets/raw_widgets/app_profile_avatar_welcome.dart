import 'package:flutter/material.dart';

class AppProfileAvatarWelcome extends StatelessWidget {
  const AppProfileAvatarWelcome(
      {super.key,
      required this.imageAvatarUrl,
      required this.welcomeMessage,
      required this.userDisplayName});
  final String imageAvatarUrl;
  final String welcomeMessage;
  final String userDisplayName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: NetworkImage(imageAvatarUrl)),
            ),
          ),
          const Padding(padding: EdgeInsets.all(5.0)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              welcomeMessage.isEmpty
                  ? Container()
                  : Text(
                      '$welcomeMessage 👋',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
              Text(
                userDisplayName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
