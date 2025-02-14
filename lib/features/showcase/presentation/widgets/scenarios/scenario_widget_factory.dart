import 'package:flutter/material.dart';
import '../../../../../core/enums/showcase_scenario.dart';
import '../../../../../core/enums/widget_style.dart';
import 'login_scenario.dart';
import 'purchase_scenario.dart';

class ScenarioWidgetFactory {
  static Widget createWidget(ShowcaseScenario scenario, WidgetStyle style) {
    switch (scenario) {
      case ShowcaseScenario.login:
        return LoginScenario(style: style);
      case ShowcaseScenario.purchase:
        return PurchaseScenario(style: style);
      // Add other scenarios as we implement them
      default:
        return Center(
          child: Text('Scenario ${scenario.title} not implemented yet'),
        );
    }
  }
}
