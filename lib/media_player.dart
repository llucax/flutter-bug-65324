import 'package:flutter/material.dart';

import 'controller_registry.dart';
import 'medium_player_controller.dart'; // removing this import fixes the issue

class MediaPlayer extends StatefulWidget {
  final void Function(BuildContext) onMediaStopped;

  const MediaPlayer({
    this.onMediaStopped,
  });

  @override
  MediaPlayerState createState() => MediaPlayerState();
}

class MediaPlayerState extends State<MediaPlayer> {
  @override
  void initState() {
    super.initState();
    final create = ControllerRegistry().getFunction('a');
    create(Uri.parse('a'), onMediaFinished: widget.onMediaStopped);
  }

  @override
  Widget build(BuildContext context) => null;
  // Converting this function to use the {} syntax or returning a Container()
  // sometimes fixes the issue, sometimes it doesn't. If seems to be very
  // flaky.
  //@override
  //Widget build(BuildContext context) {
  //  return Container();
  //}
}
