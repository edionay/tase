import 'package:tase/models/user.dart';
import 'package:tase/services/mocked_data.dart';

class API {
  static Future<List<User>> getUsers() async {
    final users = USERS;

    return users;
  }
}
