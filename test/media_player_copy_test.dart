import 'package:flutter/material.dart' show BuildContext, GlobalKey, Key;

import 'package:bug/controller_registry.dart';
import 'package:bug/media_player.dart'; // Removing this import fixed the issue

// removing the async fixes the issue
void main() async {
  // removing this instantiation fixes the issue
  FakeMediumPlayerController();
}

// Removing this class fixes the issue
class FakeSingleMedium extends Object {
  final Uri resource = Uri.parse('fake.medium');
  FakeSingleMedium();
}

Uri playerLocation;
void Function(BuildContext) playerOnMediaStopped;

class FakeControllerRegistry extends ControllerRegistry {
  @override
  ControllerCreateFunction getFunction(Object medium) {
    return (Uri location, {void Function(BuildContext) onMediaFinished}) {
      // removing this line fixes the issue
      playerOnMediaStopped = onMediaFinished;
      // replacing it with or adding this line also shows the issue
      playerLocation = location;
      return null;
    };
  }
}

class FakeMediumPlayerController extends MediumPlayerController {
  // removing any of these variables fixes the issue
  final Duration duration;
  final Duration initDelay;
  final Key builtWidgetKey;

  // Changing the initializers in any way I tried fixes the issue
  FakeMediumPlayerController({
    Uri location,
    Duration duration,
    Duration initDelay,
  })  : initDelay = initDelay ?? Duration.zero,
        duration = duration ?? Duration.zero,
        builtWidgetKey = GlobalKey(debugLabel: 'builtWidgetKey');

  // removing this getter fixes the issue
  @override
  void Function(BuildContext) get onMediaFinished => (BuildContext context) {
        playerOnMediaStopped?.call(context);
      };
}
