// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description:
// -------------------------------------------------------------------
import 'package:app/poyopoyo_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: 'packages/poyopoyo_weather/.env');
  } catch (e) {
    // 本番で .env を同梱しない方針でも落ちないように
    debugPrint('dotenv load skipped: $e');
  }

  runApp(ProviderScope(child: PoyopoyoApp()));
}
