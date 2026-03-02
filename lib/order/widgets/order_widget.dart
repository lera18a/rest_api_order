import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    super.key,
    required this.child,
    required this.isLoading,
    required this.onCreate,
    required this.buttonText,
  });

  final Widget child;
  final bool isLoading;
  final VoidCallback onCreate;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              child,
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : onCreate,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
