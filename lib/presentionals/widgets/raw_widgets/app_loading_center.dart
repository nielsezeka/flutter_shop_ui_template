import 'package:flutter/material.dart';

class AppLoadingCenter extends StatelessWidget {
  const AppLoadingCenter({super.key, required this.isLoading});
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return Container();
    }
    return Positioned.fill(
      child: Container(
        color: Colors.black38,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
