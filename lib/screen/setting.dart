import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: Center(
        child: Switch(
          value: themeChange.darkTheme,
          onChanged: (value) {
            setState(() {
              themeChange.darkTheme = value;
            });
          },
        ),
      ),
    );
  }
}
