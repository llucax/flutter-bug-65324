import 'package:flutter/material.dart';

// Moving this class to controller_registry.dart fixes the issue
abstract class MediumPlayerController {
  final void Function(BuildContext) onMediaFinished;

  MediumPlayerController({this.onMediaFinished});
}
