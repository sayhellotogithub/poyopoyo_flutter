// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/08
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);