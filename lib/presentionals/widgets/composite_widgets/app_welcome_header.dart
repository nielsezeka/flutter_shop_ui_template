import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../presentionals_index.dart';

class AppWelcomeHeader extends StatelessWidget {
  const AppWelcomeHeader({
    super.key,
    required this.onClickNotification,
    required this.onClickFavourite,
    required this.userName,
    required this.greetingMessage,
  });
  final VoidCallback onClickNotification;
  final VoidCallback onClickFavourite;
  final String userName;
  final String greetingMessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppProfileAvatarWelcome(
          imageAvatarUrl: 'https://i.pravatar.cc/300',
          welcomeMessage: greetingMessage,
          userDisplayName: userName,
        ),
        const Spacer(),
        IconButton(
          onPressed: () => onClickNotification(),
          icon: const Icon(
            Iconsax.notification,
          ),
        ),
        IconButton(
          onPressed: () => onClickFavourite(),
          icon: const Icon(
            Iconsax.heart,
          ),
        )
      ],
    );
  }
}
