import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:permission_handler/permission_handler.dart';

class MyVideoPlayer extends StatefulWidget {
  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  VlcPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _requestPermissionAndInitializePlayer();
  }

  Future<void> _requestPermissionAndInitializePlayer() async {
    var status = await Permission.mediaLibrary.request();

    if (status.isGranted) {
      _initializePlayer();
    } else {
      // Gérer le cas où la permission est refusée
      print("Permission refusée");
    }
  }

  Future<void> _initializePlayer() async {
    // Initialiser le lecteur vidéo ici
    _controller = VlcPlayerController.network(
      'rtsp://142.44.214.231:1935/saheltv/myStream',
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    setState(() {}); // Rafraîchir l'interface utilisateur après avoir obtenu l'autorisation.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller != null
            ? VlcPlayer(
          controller: _controller!,
          aspectRatio: 16 / 9,
          placeholder: Center(child: CircularProgressIndicator()),
        )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
