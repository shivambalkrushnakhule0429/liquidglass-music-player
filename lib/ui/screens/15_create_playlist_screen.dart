import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_button.dart';

class CreatePlaylistScreen extends StatefulWidget {
  final int? editPlaylistId;
  const CreatePlaylistScreen({super.key, this.editPlaylistId});

  @override
  State<CreatePlaylistScreen> createState() => _CreatePlaylistScreenState();
}

class _CreatePlaylistScreenState extends State<CreatePlaylistScreen> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editPlaylistId == null ? "New Playlist" : "Edit Playlist", style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Column(
          children: [
            GlassPanel(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: "Playlist Name",
                  hintStyle: TextStyle(color: Colors.white60),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            GlassButton(
              onTap: () => Navigator.pop(context),
              child: const Text("Create", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
