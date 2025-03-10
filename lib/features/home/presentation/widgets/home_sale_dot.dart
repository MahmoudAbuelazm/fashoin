import 'package:flutter/material.dart';


class HomeSaleDot extends StatelessWidget {
  const HomeSaleDot({
    super.key,
    required int current,
    required this.i,
  }) : _current = current;

  final int _current;
  final int i;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _current == i
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).cardColor,
      ),
    );
  }
}
