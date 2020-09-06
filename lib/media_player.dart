import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show PlatformException;

import 'controller_registry.dart';
import 'medium_player_controller.dart';

class MediaPlayer extends StatefulWidget {
  final Uri medium;
  final void Function(BuildContext) onMediaStopped;
  final ControllerRegistry registry;

  const MediaPlayer({
    @required this.medium,
    this.onMediaStopped,
    this.registry,
    Key key,
  })  : assert(medium != null),
        super(key: key);

  @override
  MediaPlayerState createState() => MediaPlayerState();
}

/// A state for a [MediaPlayer].
class MediaPlayerState extends State<MediaPlayer> {
  @override
  void initState() {
    super.initState();
    final create = widget.registry.getFunction(widget.medium);
    create(widget.medium, onMediaFinished: widget.onMediaStopped);
  }

  /// Builds the UI for this widget.
  @override
  Widget build(BuildContext context) {
    return Container(key: widget.key);
  }
}
