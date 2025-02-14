import 'package:flutter/material.dart';
import '../../../../core/enums/showcase_scenario.dart';
import 'scenario_page.dart';

class ShowcaseHomePage extends StatelessWidget {
  const ShowcaseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Input Showcase')),
      body: ListView.builder(
        itemCount: ShowcaseScenario.values.length,
        itemBuilder: (context, index) {
          final scenario = ShowcaseScenario.values[index];
          return ListTile(
            title: Text(scenario.title),
            subtitle: Text(scenario.description),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScenarioPage(scenario: scenario),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
