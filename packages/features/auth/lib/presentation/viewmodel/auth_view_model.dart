// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description:
// -------------------------------------------------------------------
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecase/auth_token_repository.dart';
import '../../domain/usecase/clear_refresh_token_usecase.dart';
import '../../domain/usecase/save_refresh_token_usecase.dart';

class AuthState {
  final String? refreshToken;
  final bool isLoading;
  final String? errorMessage;

  const AuthState({
    this.refreshToken,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    String? refreshToken,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      refreshToken: refreshToken ?? this.refreshToken,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  const AuthState.initial()
      : refreshToken = null,
        isLoading = false,
        errorMessage = null;
}

class AuthViewModel extends StateNotifier<AuthState> {
  final SaveRefreshTokenUseCase _saveUseCase;
  final GetRefreshTokenUseCase _getUseCase;
  final ClearRefreshTokenUseCase _clearUseCase;

  String? _refreshToken;

  String? get refreshToken => _refreshToken;

  AuthViewModel({
    required SaveRefreshTokenUseCase saveUseCase,
    required GetRefreshTokenUseCase getUseCase,
    required ClearRefreshTokenUseCase clearUseCase,
  })  : _saveUseCase = saveUseCase,
        _getUseCase = getUseCase,
        _clearUseCase = clearUseCase,
        super(const AuthState.initial());

  /// Refresh Token を保存
  Future<void> saveToken(String token) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _saveUseCase(token);
      state = state.copyWith(
        refreshToken: token,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadToken() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final token = await _getUseCase();
      state = state.copyWith(
        refreshToken: token,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await _clearUseCase();
      state = const AuthState.initial();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}
