import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/components/note_list.dart';
import 'package:nota/cubits/notes_data_cubit/cubit.dart';

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
      body: BlocProvider(
        create: (context) => NotesDataCubit(),
        child: const NotesList(),
      ),
    );
  }
}
