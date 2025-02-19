// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/enums/widget_style.dart';

class ChatScenario extends StatefulWidget {
  final WidgetStyle style;

  const ChatScenario({super.key, required this.style});

  @override
  State<ChatScenario> createState() => _ChatScenarioState();
}

class _ChatScenarioState extends State<ChatScenario> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildMaterialVersion() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                reverse: true,
                children: <Widget>[
                  _Message(
                    sender: _Sender.me,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  _Message(
                    sender: _Sender.someoneElse,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffdddddd),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO(justinmc): Submit.
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
            SizedBox(height: 8.0),
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
            Expanded(
              child: ListView(
                reverse: true,
                children: <Widget>[
                  _Message(
                    sender: _Sender.me,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                  _Message(
                    sender: _Sender.someoneElse,
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Flexible(child: CupertinoTextField()),
                CupertinoButton(
                  onPressed: () {
                    // TODO(justinmc): Submit.
                  },
                  child: Icon(CupertinoIcons.arrow_right),
                ),
              ],
            ),
            SizedBox(height: 8.0),
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

class _Message extends StatelessWidget {
  const _Message({required this.text, required this.sender});

  final String text;
  final _Sender sender;

  Color get _backgroundColor => switch (sender) {
    _Sender.me => Colors.blue,
    _Sender.someoneElse => Colors.grey,
  };

  Color get _textColor => switch (sender) {
    _Sender.me => Colors.white,
    _Sender.someoneElse => Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          if (sender == _Sender.me) SizedBox(width: 24.0),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text, style: TextStyle(color: _textColor)),
              ),
            ),
          ),
          if (sender == _Sender.someoneElse) SizedBox(width: 24.0),
        ],
      ),
    );
  }
}

enum _Sender { me, someoneElse }
