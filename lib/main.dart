import 'package:flutter/material.dart';
import 'package:number_system/converter_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';

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