import 'package:flutter/material.dart';
import 'package:locator/pages/home.dart';
import 'package:locator/pages/replay.dart';

void main() {
  runApp(MaterialApp(
    home: const Home(),
    routes: {
      '/replay': (context) => const Replay(),
    },
  ));
}
