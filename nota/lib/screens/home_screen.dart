import 'package:flutter/material.dart';
import 'package:nota/components/note_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nota'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.white70,
      body: NotesList(),
    );
  }
}
