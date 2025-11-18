// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description:
// -------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';

class AuthDebugPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authViewModelProvider);
    final vm = ref.read(authViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Token Debug"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => vm.saveToken('dummy_refresh_token_123'),
            child: const Text('Save Token'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: vm.loadToken,
            child: const Text('Load Token'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: vm.logout,
            child: const Text('Clear Token'),
          ),
          if (state.isLoading) const LinearProgressIndicator(),
          const SizedBox(height: 16),
          Text('Refresh Token: ${state.refreshToken ?? "null"}'),
          if (state.errorMessage != null) ...[
            const SizedBox(height: 8),
            Text(
              'Error: ${state.errorMessage}',
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}
