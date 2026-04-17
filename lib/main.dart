import 'package:flutter/material.dart';
import 'presentation/provider/binary_addition_provider.dart';
import 'presentation/provider/converter_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NumberSystemProvider()),
        ChangeNotifierProvider(create: (_) => BinaryStateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}