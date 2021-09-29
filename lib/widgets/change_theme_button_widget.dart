
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welcome/provider/demoProvider.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DemoProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<DemoProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}