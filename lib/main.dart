import 'package:diary_app/pages/home_page.dart';
import 'package:diary_app/provider/provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  await initializeDateFormatting('ru', null);

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: const DiaryApp(),
    ),
  );
}

class DiaryApp extends StatelessWidget {
  const DiaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
