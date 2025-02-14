// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/showcase/presentation/pages/showcase_home_page.dart';

class TextInputShowcaseApp extends StatelessWidget {
  const TextInputShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Input Showcase',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const ShowcaseHomePage(),
    );
  }
}
