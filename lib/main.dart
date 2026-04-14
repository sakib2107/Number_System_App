import 'package:flutter/material.dart';
import 'converter_provider.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BinaryToHexProvider()),
      ],
      child: const MyApp(),
    ),
  );
}