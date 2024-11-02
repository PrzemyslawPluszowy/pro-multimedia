import 'package:flutter/material.dart';
import 'package:pro_multimedia/bootstrap.dart';
import 'package:pro_multimedia/features/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const App());
}
