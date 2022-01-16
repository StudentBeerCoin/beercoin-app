import 'package:beercoin/entity/user.dart';

class AppConfig {
  static const host = 'https://beercoin.xyz';

  static Future<User> currentUser = User.fetchUser('68900ae2-8849-482e-88d3-c74cc1c661aa');
}