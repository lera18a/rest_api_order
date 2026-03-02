import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
        SizedBox(height: 23),
      ],
    );
  }
}
