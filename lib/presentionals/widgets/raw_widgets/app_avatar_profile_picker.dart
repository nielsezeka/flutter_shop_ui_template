import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_item_style_configuration.dart';

class AvatarProfilePicker extends StatefulWidget {
  const AvatarProfilePicker({super.key, required this.onClickSelectAvatar});
  final VoidCallback onClickSelectAvatar;
  @override
  State<AvatarProfilePicker> createState() => _AvatarProfilePickerState();
}

class _AvatarProfilePickerState extends State<AvatarProfilePicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
              padding:
                  EdgeInsets.only(top: AppStyleConfiguration.paddingSpacer)),
          Expanded(
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  width: 50,
                  height: 50,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => widget.onClickSelectAvatar(),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
