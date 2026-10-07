import 'package:flutter/material.dart';

import 'kartu_identitas.dart';

void main() {
  runApp(const KartuIdentitasApp());
}

class KartuIdentitasApp extends StatelessWidget {
  const KartuIdentitasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Identitas Digital',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF0B6B45),
        useMaterial3: true,
      ),
      home: const HalamanKartuIdentitas(),
    );
  }
}