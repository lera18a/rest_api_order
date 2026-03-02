import 'package:flutter/material.dart';

class ApiErrorWidget extends StatelessWidget {
  const ApiErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                error,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
