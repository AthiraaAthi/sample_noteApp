import 'package:flutter/material.dart';
import 'package:hive_adapterclass/model/notes_model.dart';

import 'package:hive_adapterclass/view/home_screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter;
  Hive.registerAdapter(
      NotesModelAdapter()); //registering the adaptersbefore opening the box
  var box = await Hive.openBox<NotesModel>("noteBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
