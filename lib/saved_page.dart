import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.atma(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCAD4D1), Color(0xFFDAB7B1)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Text("Saved Music", style: titleStyle),
            const SizedBox(height: 20),
            Image.asset('assets/note_image.png', width: 300, height: 300),
            const SizedBox(height: 30),
            AudioTile(
              title: "Funny Cat",
              filePath: "assets/audio/sample_audio.mp3",
            ),
            const SizedBox(height: 20),
            AudioTile(
              title: "Lion Roar",
              filePath: "assets/audio/sample_audio.mp3",
            ),
            const SizedBox(height: 20),
            AudioTile(
              title: "Elephant Trumpet",
              filePath: "assets/audio/sample_audio.mp3",
            ),
          ],
        ),
      ),
    );
  }
}

class AudioTile extends StatefulWidget {
  final String title;
  final String filePath;

  const AudioTile({super.key, required this.title, required this.filePath});

  @override
  State<AudioTile> createState() => _AudioTileState();
}

class _AudioTileState extends State<AudioTile> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    _player = AudioPlayer();
    try {
      await _player.setAsset(widget.filePath);
    } catch (e) {
      print('Error loading audio asset: ${widget.filePath}');
      print('Exception: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 32,
              color: Colors.black87,
            ),
            onPressed: _togglePlay,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.title,
              style: GoogleFonts.atma(fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
