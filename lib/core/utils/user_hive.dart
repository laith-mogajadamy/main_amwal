import 'package:hive/hive.dart';

class UserRepository {
  static const String userBoxName = 'userBox';

  late Box userBox;

  /// Initialize Hive storage
  Future<void> init() async {
    userBox = await Hive.openBox(userBoxName);
  }

  /// Save username and password
  Future<void> saveUser(String username, String password) async {
    await userBox.put('username', username);
    await userBox.put('password', password);
  }

  /// Retrieve username and password
  Map<String, String?> getUser() {
    return {
      'username': userBox.get('username'),
      'password': userBox.get('password'),
    };
  }

  /// Delete user credentials (Logout)
  Future<void> deleteUser() async {
    await userBox.delete('username');
    await userBox.delete('password');
  }
}
