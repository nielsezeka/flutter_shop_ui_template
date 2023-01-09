import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class TopupPINInput extends StatefulWidget {
  const TopupPINInput({super.key});

  @override
  State<TopupPINInput> createState() => _TopupPINInputState();
}

class _TopupPINInputState extends State<TopupPINInput> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // const AppNavigationBar(tittle: 'Enter your PIN'),
            const AppVerticalPadding(
              multiplier: 2,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AppHorizontalPaddingChild(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      AppVerticalPadding(),
                      AppInputPin(),
                      AppVerticalPadding(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
