import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nota/features/notes/view_model/cubit.dart';
import 'package:nota/features/home/views/home_screen.dart';
import 'features/themes/presentation/view_model/theme_provider_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesDataCubit(),
        ),
      ],
      child: const ThemeProviderWidget(home: HomeScreen()),
    );
  }
}