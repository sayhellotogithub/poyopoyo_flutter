// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/12
// Description: 
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/login_localizations.dart';

class KycScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(LoginLocalizations.of(context)!.login_title)),
      body: Center(
        child: Text("This is a login page"),
      ),
    );
  }

}