import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:rxdart/rxdart.dart';

class AppSettingSwitchTile extends StatefulWidget {
  const AppSettingSwitchTile({
    super.key,
    required this.tittle,
    required this.isEnableStream,
    required this.onSwitched,
  });
  final String tittle;
  final BehaviorSubject<bool> isEnableStream;
  final ValueChanged<bool> onSwitched;
  @override
  State<AppSettingSwitchTile> createState() => _AppSettingSwitchTileState();
}

class _AppSettingSwitchTileState extends State<AppSettingSwitchTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppThreePartsButtons(
      leading: Container(),
      center: Text(
        widget.tittle,
        style: Theme.of(context).textTheme.headline6,
      ),
      trailing: StreamBuilder<bool>(
          stream: widget.isEnableStream,
          builder: (context, snapshot) {
            final isActived = snapshot.data ?? false;
            return CupertinoSwitch(
              activeColor: Theme.of(context).primaryColor,
              trackColor: Theme.of(context).primaryColor.withOpacity(0.3),
              value: isActived,
              onChanged: (value) {
                widget.onSwitched(value);
              },
            );
          }),
    );
  }
}
