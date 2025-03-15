import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/scenario_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isCupertino =
        context.findAncestorWidgetOfExactType<CupertinoApp>() != null;

    if (isCupertino) {
      return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Text Input Kitchen Sink'),
        ),
        child: SafeArea(child: ScenarioList(isCupertino: true)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Text Input Kitchen Sink')),
      body: ScenarioList(isCupertino: false),
    );
  }
}
