import 'package:flutter/material.dart';

class linearindicator extends StatefulWidget {
  final double value;
  const linearindicator({
    super.key,
    required this.value,
  });

  @override
  State<linearindicator> createState() => _linearindicatorState();
}

class _linearindicatorState extends State<linearindicator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: LinearProgressIndicator(
        value: widget.value,
        backgroundColor: Colors.white.withOpacity(0.3),
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}