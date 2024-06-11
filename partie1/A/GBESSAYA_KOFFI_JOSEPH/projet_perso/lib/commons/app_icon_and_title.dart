import 'package:flutter/material.dart';

class AppIconAndTitle extends StatelessWidget {
  const AppIconAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/logo.png'),
                  width: 100,
                  height: 100,
                ),
                Text('Botanicare', style: theme.textTheme.displayMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
