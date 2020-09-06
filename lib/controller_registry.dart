import 'package:flutter/material.dart';

import 'dynamic_dispatch_registry.dart';

abstract class MediumPlayerController {
  final void Function(BuildContext) onMediaFinished;

  MediumPlayerController({this.onMediaFinished});
}

typedef ControllerCreateFunction = MediumPlayerController Function(
  Uri location, {
  void Function(BuildContext) onMediaFinished,
});

class ControllerRegistry
    extends DynamicDispatchRegistry<Object, ControllerCreateFunction> {
  ControllerRegistry();
}
