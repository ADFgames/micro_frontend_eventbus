import 'package:dependencies/dependencies.dart';

class StorageTokenAuth {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<String?> getTokenAuth() async {
    return await storage.read(key: "TokenAuth");
  }

  Future<String?> getTokenRefreshAuth() async {
    return await storage.read(key: "TokenRefreshAuth");
  }

  Future<void> setTokenAuth(String token) async {
    await storage.write(key: "TokenAuth", value: token);
  }

  Future<void> setTokenRefreshAuth(String token) async {
    await storage.write(key: "TokenRefreshAuth", value: token);
  }

  Future<void> deleteTokenAuth() async {
    await storage.delete(key: "TokenAuth");
  }

  Future<void> deleteTokenRefreshAuth() async {
    await storage.delete(key: "TokenRefreshAuth");
  }

  Future<void> deleteAllToken() async {
    await storage.deleteAll();
  }
}
