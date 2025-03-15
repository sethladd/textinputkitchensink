import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/enums/showcase_scenario.dart';
import '../../../../core/enums/widget_style.dart';
import '../features/showcase/presentation/widgets/scenarios/scenario_widget_factory.dart';

class ScenarioList extends StatelessWidget {
  final bool isCupertino;

  const ScenarioList({super.key, required this.isCupertino});

  @override
  Widget build(BuildContext context) {
    var scenarios = ShowcaseScenario.values;

    if (isCupertino) {
      return ListView.builder(
        itemCount: scenarios.length,
        itemBuilder: (context, index) {
          return CupertinoListTile(
            title: Text(scenarios[index].title),
            subtitle: Text(scenarios[index].description),
            trailing: const CupertinoListTileChevron(),
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder:
                      (context) => CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text(scenarios[index].title),
                        ),
                        child: SafeArea(
                          child: ScenarioWidgetFactory.createWidget(
                            scenarios[index],
                            WidgetStyle.cupertino,
                          ),
                        ),
                      ),
                ),
              );
            },
          );
        },
      );
    }

    return ListView.builder(
      itemCount: scenarios.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(scenarios[index].title),
          subtitle: Text(scenarios[index].description),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder:
                    (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text('Text Input Kitchen Sink'),
                      ),
                      body: ScenarioWidgetFactory.createWidget(
                        scenarios[index],
                        WidgetStyle.material,
                      ),
                    ),
              ),
            );
          },
        );
      },
    );
  }
}
