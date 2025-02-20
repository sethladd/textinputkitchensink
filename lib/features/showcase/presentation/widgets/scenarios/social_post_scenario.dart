// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/enums/widget_style.dart';

class SocialPostScenario extends StatefulWidget {
  final WidgetStyle style;

  const SocialPostScenario({super.key, required this.style});

  @override
  State<SocialPostScenario> createState() => _SocialPostScenarioState();
}

class _SocialPostScenarioState extends State<SocialPostScenario> {
  Widget _buildMaterialVersion() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: <Widget>[
            TextFormField(maxLines: null),
            TextButton(
              onPressed: () {
                // TODO(justinmc): Submit.
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoVersion() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: <Widget>[
            CupertinoTextField(maxLines: null),
            CupertinoButton(
              onPressed: () {
                // TODO(justinmc): Submit.
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.style == WidgetStyle.material
        ? _buildMaterialVersion()
        : _buildCupertinoVersion();
  }
}
