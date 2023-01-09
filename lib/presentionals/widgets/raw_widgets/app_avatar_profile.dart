import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppAvatarProfile extends StatefulWidget {
  const AppAvatarProfile({super.key, required this.imageAvatarUrl});
  final String imageAvatarUrl;
  @override
  State<AppAvatarProfile> createState() => _AppAvatarProfileState();
}

class _AppAvatarProfileState extends State<AppAvatarProfile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
              padding:
                  EdgeInsets.only(top: AppStyleConfiguration.paddingSpacer)),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  image: widget.imageAvatarUrl.isEmpty
                      ? null
                      : DecorationImage(
                          image: NetworkImage(
                            widget.imageAvatarUrl,
                          ),
                        ),
                ),
              ),
            ),
          ),
          Text(
            'Awesome Guy',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '+1 111 2222 3333',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const AppVerticalPadding(),
          Divider(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ],
      ),
    );
  }
}
