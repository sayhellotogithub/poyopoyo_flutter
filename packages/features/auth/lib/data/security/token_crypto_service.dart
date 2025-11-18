// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/11/18
// Description:
// -------------------------------------------------------------------
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto_core/crypto.dart';
import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenCryptoService implements TokenEncryptor {
  static const _aesKeyStorageKey = 'aes_master_key';
  static const _refreshTokenKey = 'encrypted_refresh_token';

  final FlutterSecureStorage _storage;
  final AesGcm _cipher;

  TokenCryptoService({FlutterSecureStorage? secureStorage, AesGcm? cipher})
      : _storage = secureStorage ?? const FlutterSecureStorage(),
        _cipher = cipher ?? AesGcm.with256bits();

  /// 初回だけランダムな AES キーを生成して secure_storage に保存。
  Future<SecretKey> _loadOrCreateAesKey() async {
    final existing = await _storage.read(key: _aesKeyStorageKey);
    if (existing != null) {
      return SecretKey(base64Decode(existing));
    }

    final rng = Random.secure();
    final keyBytes = List<int>.generate(32, (_) => rng.nextInt(256));
    await _storage.write(key: _aesKeyStorageKey, value: base64Encode(keyBytes));
    return SecretKey(Uint8List.fromList(keyBytes));
  }

  @override
  Future<void> saveEncryptedRefreshToken(String refreshToken) async {
    final key = await _loadOrCreateAesKey();

    final nonceBytes =
        List<int>.generate(12, (_) => Random.secure().nextInt(256));

    final secretBox = await _cipher.encrypt(
      utf8.encode(refreshToken),
      secretKey: key,
      nonce: nonceBytes,
    );

    final payload = jsonEncode({
      'nonce': base64Encode(secretBox.nonce),
      'cipherText': base64Encode(secretBox.cipherText),
      'mac': base64Encode(secretBox.mac.bytes),
    });

    await _storage.write(key: _refreshTokenKey, value: payload);
  }

  @override
  Future<String?> loadDecryptedRefreshToken() async {
    final jsonStr = await _storage.read(key: _refreshTokenKey);
    if (jsonStr == null) return null;

    final map = jsonDecode(jsonStr) as Map<String, dynamic>;
    final key = await _loadOrCreateAesKey();

    final nonceBytes = base64Decode(map['nonce']);
    final cipherText = base64Decode(map['cipherText']);
    final mac = Mac(base64Decode(map['mac']));

    final secretBox = SecretBox(cipherText, nonce: nonceBytes, mac: mac);
    final clearBytes = await _cipher.decrypt(secretBox, secretKey: key);

    return utf8.decode(clearBytes);
  }

  @override
  Future<void> clearRefreshToken() {
    return _storage.delete(key: _refreshTokenKey);
  }
}
