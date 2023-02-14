import 'package:flutter/material.dart';
import 'package:vph_web_date_picker/vph_web_date_picker.dart';

import 'material_theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TextEditingController _controller;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _controller = TextEditingController(text: _selectedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    final textFieldKey = GlobalKey();
    return MaterialApp(
      title: 'Web Date Picker Demo',
      theme: ThemeData(/* useMaterial3: true, */ colorScheme: lightColorScheme),
      darkTheme:
          ThemeData(/* useMaterial3: true, */ colorScheme: darkColorScheme),
      home: Scaffold(
        body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 360.0),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            child: TextField(
              key: textFieldKey,
              controller: _controller,
              onTap: () async {
                final pickedDate = await showWebDatePicker(
                  context: textFieldKey.currentContext!,
                  initialDate: _selectedDate,
                );
                if (pickedDate != null) {
                  _selectedDate = pickedDate;
                  _controller.text = pickedDate.toString();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}