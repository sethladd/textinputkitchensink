// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'screens/style_selection_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppStyle? selectedStyle;

  void _handleStyleSelection(AppStyle style) {
    setState(() {
      selectedStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedStyle == null) {
      return WidgetsApp(
        color: const Color(0xFF000000),
        builder:
            (context, child) =>
                StyleSelectionScreen(onStyleSelected: _handleStyleSelection),
      );
    }

    if (selectedStyle == AppStyle.material) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      );
    } else {
      return CupertinoApp(
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.systemBlue,
        ),
        home: const HomeScreen(),
      );
    }
  }
}
