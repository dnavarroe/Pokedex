import 'package:flutter/material.dart';

class PoError extends StatelessWidget {
  final String? error;
  const PoError({
    super.key,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error ?? 'No fue posible cargar el pokemon'),
      ),
    );
  }
}
