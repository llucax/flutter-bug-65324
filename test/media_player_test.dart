import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:bug/controller_registry.dart';
import 'package:bug/media_player.dart'; // Removing this import fixed the issue

void main() {
  testWidgets('initializes with error', (WidgetTester tester) async {
    FakeMediumPlayerController();
  });
}

class FakeSingleMedium extends Object {
  final Uri resource = Uri.parse('fake.medium');
  FakeSingleMedium();
}

class FakeControllerRegistry extends ControllerRegistry {
  final FakeMediumPlayerController controller;
  FakeControllerRegistry(this.controller);
  @override
  ControllerCreateFunction getFunction(Object medium) {
    return (Uri location, {void Function(BuildContext) onMediaFinished}) {
      controller.playerLocation = location;
      controller.playerOnMediaStopped = onMediaFinished;
      return null;
    };
  }
}

class FakeMediumPlayerController extends MediumPlayerController {
  Uri playerLocation;
  void Function(BuildContext) playerOnMediaStopped;

  final Duration duration;
  final Duration initDelay;
  final Key builtWidgetKey;

  FakeMediumPlayerController({
    Uri location,
    Duration duration,
    Duration initDelay,
  })  : initDelay = initDelay ?? Duration(milliseconds: 10),
        duration = duration ?? Duration.zero,
        builtWidgetKey = GlobalKey(debugLabel: 'builtWidgetKey');

  @override
  void Function(BuildContext) get onMediaFinished => (BuildContext context) {
        playerOnMediaStopped?.call(context);
      };
}
