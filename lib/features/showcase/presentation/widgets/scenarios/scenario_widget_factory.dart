// Copyright 2025 Seth Ladd. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../../../../../core/enums/showcase_scenario.dart';
import '../../../../../core/enums/widget_style.dart';
import 'chat_scenario.dart';
import 'login_scenario.dart';
import 'purchase_scenario.dart';
import 'profile_scenario.dart';
import 'settings_scenario.dart';
import 'social_post_scenario.dart';
import 'chat_scenario.dart';

class ScenarioWidgetFactory {
  static Widget createWidget(ShowcaseScenario scenario, WidgetStyle style) {
    switch (scenario) {
      case ShowcaseScenario.login:
        return LoginScenario(style: style);
      case ShowcaseScenario.purchase:
        return PurchaseScenario(style: style);
      case ShowcaseScenario.profile:
        return ProfileScenario(style: style);
      case ShowcaseScenario.settings:
        return SettingsScenario(style: style);
      case ShowcaseScenario.chat:
        return ChatScenario(style: style);
      case ShowcaseScenario.socialPost:
        return SocialPostScenario(style: style);
      // Add other scenarios as we implement them
      default:
        return Center(
          child: Text('Scenario ${scenario.title} not implemented yet'),
        );
    }
  }
}
